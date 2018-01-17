//
//  Report_ObserveMore100To500.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/19.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

class ObservingData {
    var beforeSearchListDataRecord = DataRecord()
    var countType = CountType.NotAvaliable
    var isFromSearchList = false
}

class Report_ObserveDetailResultCountAndAmbiguousConditionType {

    static let shared = Report_ObserveDetailResultCountAndAmbiguousConditionType()
    private var data = [DataRecord]()
    var report = [ReportSearchResultListActivity]()
    var specificReports = [ReportConditionNumberAndConditionRankingOfSpecificType]()
    var countTypeAndConditionFlow = [ReportCountTypeConditionFlowstatistics]()
    
    init() {
        data = Util.read()
        
        data.sort { (a, b) -> Bool in
            return b.time.timeIntervalSince(a.time) >= 0
        }
        
        report = Util.generateReport_ObserveDetailResultCountAndAmbiguousConditionType()
//        specificReports = Util.generateReportConditionNumberAndConditionRankingOfSpecificType()
    }
    
    func observe() {
        print("start observing!")
        
        var observingUsers = [String: ObservingData]()
        
        while !data.isEmpty {
            let item = data.first!
            
            guard let uuid = item.uuid, !uuid.isEmpty, item.version == "タウンワーク4.49.0" else {
                data.removeFirst()
                continue
            }
            
            observingUsers = removeExpiredObservingUser(observingUser: observingUsers, time: item.time)
            
            let nowPage = Util.dataRecordWatchingPage(item)

            switch nowPage {
            case .SearchList:
                let countType = Util.dataUnitCountType(unit: item)
                if countType == .NotAvaliable {
                    data.removeFirst()
                    continue
                }
                if let existingUser = observingUsers[uuid] {
                    if existingUser.beforeSearchListDataRecord.searchConditionChanged(item) {
                        observingUsers[uuid]!.beforeSearchListDataRecord = item
                        observingUsers[uuid]!.countType = countType
                        observingUsers[uuid]!.isFromSearchList = true
                        addOneToTotalNumber(for: countType)
                        addCountTypeAndConditionFlow(countType: countType, dataRecord: item)
                    } else {
                        observingUsers[uuid]!.beforeSearchListDataRecord = item
                        observingUsers[uuid]!.countType = CountType.preferentialCountType(beforeType: existingUser.countType, afterType: countType)
                        observingUsers[uuid]!.isFromSearchList = true
                    }
                } else{
                    let addData = ObservingData()
                    addData.beforeSearchListDataRecord = item
                    addData.countType = countType
                    addData.isFromSearchList = true
                    observingUsers[item.uuid!] = addData
                    addOneToTotalNumber(for: countType)
                    addCountTypeAndConditionFlow(countType: countType, dataRecord: item)
                }
                data.removeFirst()
            case .Applied:
                if let existingUser = observingUsers[uuid], existingUser.isFromSearchList {
                    addNewResult((existingUser.countType, .Applied))
                }
                data.removeFirst()
            case .SameDirectionWithPreviousDirection:
                if Util.dataRecordAction(item) == .Kept {
                    if let existingUser = observingUsers[uuid], existingUser.isFromSearchList{
                        addNewResult((existingUser.countType, .Kept))
                    }
                }
                data.removeFirst()
            case .MakeDifferentDirectionFromSearchList:
                if observingUsers[uuid] != nil {
                    observingUsers[uuid]!.isFromSearchList = false
                }
                data.removeFirst()
            }
        }
        
        for item in report {
            print(item)
        }
        print("")
        print("------------SpecificReports----------------")
        for item in specificReports {
            print(item.countType)
            print(item.conditionNumberObserver)
            print("Area: \(item.areaUsedNumber)")
            print("JobType: \(item.jobTypeNumber)")
            print("RailOrStation: \(item.railOrStationnumber)")
            print("Merit: \(item.meritNumber)")
            print("HireType: \(item.hireTypeNumber)")
            print("Salary: \(item.salaryNumber)")
            print("")
        }
        
//        print("")
//        print("------------ReportCountTypeConditionFlowstatistics----------------")
//        for item in countTypeAndConditionFlow {
//            print(item.countType)
//            print(item.conditionFlow)
//            print("count: \(item.count)")
//        }
        
        print("")
        print("------------Refine ReportCountTypeConditionFlowstatistics : get条件あり＆＆検索結果数が500~の場合のcount----------------")
        var totalNumber = 0
        var countTypeAbove500Number = 0
        var countTypeBellow50Number = 0
        for item in countTypeAndConditionFlow {
            totalNumber = totalNumber + item.count
            if item.countType.rawValue >= CountType.C500To600.rawValue {
                countTypeAbove500Number = countTypeAbove500Number + item.count
            } else if item.countType.rawValue < CountType.C50To100.rawValue {
                countTypeBellow50Number = countTypeBellow50Number + item.count
            }
        }
        print("条件あり＆＆対象バナー押下して遷移した数は: \(totalNumber)")
        print("条件あり＆＆検索結果数が500~の場合の対象バナー押下して遷移した数は: \(countTypeAbove500Number)")
        print("条件あり＆＆検索結果数が50以下の場合の対象バナー押下して遷移した数は: \(countTypeBellow50Number)")
        
        print("observing finished!")
        //        Util.write(data: targetData, to: "twn_1204-1210_com.csv")
    }
    
    private func removeExpiredObservingUser(observingUser: [String: ObservingData], time: Date) -> [String: ObservingData] {
        var observingUser = observingUser
        for item in observingUser {
            if time.timeIntervalSince(item.value.beforeSearchListDataRecord.time) > 1200 {
                observingUser.removeValue(forKey: item.key)
            }
        }
        return observingUser
    }
    
    private func addOneToTotalNumber(for countType: CountType) {
        for i in 0...report.count-1 {
            if report[i].countType == countType {
                report[i].totalNum = report[i].totalNum + 1
            }
        }
    }
    
    private func addCountTypeAndConditionFlow(countType: CountType, dataRecord: DataRecord) {
        guard let conditionFlow = ConditionInflow.conditionInflowType(dataRecord) else {
            return
        }
        if countTypeAndConditionFlow.isEmpty {
            let addNewReport = ReportCountTypeConditionFlowstatistics()
            addNewReport.conditionFlow = conditionFlow
            addNewReport.countType = countType
            addNewReport.count = 1
            countTypeAndConditionFlow.append(addNewReport)
            return
        }
        for i in 0...countTypeAndConditionFlow.count-1 {
            if countTypeAndConditionFlow[i].countType == countType && countTypeAndConditionFlow[i].conditionFlow == conditionFlow {
                countTypeAndConditionFlow[i].count = countTypeAndConditionFlow[i].count + 1
                return
            }
        }
        let addNewReport = ReportCountTypeConditionFlowstatistics()
        addNewReport.conditionFlow = conditionFlow
        addNewReport.countType = countType
        addNewReport.count = 1
        countTypeAndConditionFlow.append(addNewReport)
    }
    
    private func addNewSpecificReportResult(datatype: DataType, dataRecord: DataRecord) {
        guard let specificReport = getSpecificReportFromList(datatype) else {
            return
        }
        
        var conditionCount = 0
        // Area
        if dataRecord.hasAreaCondition() {
            conditionCount = conditionCount + 1
            specificReport.areaUsedNumber = specificReport.areaUsedNumber + 1
        }
        
        // Jobtype
        if dataRecord.hasJobTypeCondition() {
            conditionCount = conditionCount + 1
            specificReport.jobTypeNumber = specificReport.jobTypeNumber + 1
        }
        
        // RailOrStation
        if dataRecord.hasRailOrStationCondition() {
            conditionCount = conditionCount + 1
            specificReport.railOrStationnumber = specificReport.railOrStationnumber + 1
        }
        
        // Merit
        if dataRecord.hasMeritCondition() {
            conditionCount = conditionCount + 1
            specificReport.meritNumber = specificReport.meritNumber + 1
        }
        
        // HireType
        if dataRecord.hasHireTypeCondition() {
            conditionCount = conditionCount + 1
            specificReport.hireTypeNumber = specificReport.hireTypeNumber + 1
        }
        
        // Salary
        if dataRecord.hasSalaryCondition() {
            conditionCount = conditionCount + 1
            specificReport.salaryNumber = specificReport.salaryNumber + 1
        }
        
        if let conditionCountType = ConditionNumber(rawValue: conditionCount) {
            if let thisCount = specificReport.conditionNumberObserver[conditionCountType] {
                specificReport.conditionNumberObserver[conditionCountType] = thisCount + 1
            } else {
                specificReport.conditionNumberObserver[conditionCountType] = 1
            }
        } else {
            fatalError("Impossible!")
        }
    }
    
    private func getSpecificReportFromList(_ dataType: DataType) -> ReportConditionNumberAndConditionRankingOfSpecificType? {
        for item in specificReports {
            if item.countType == dataType.countType {
                return item
            }
        }
        return nil
    }
    
    private func addNewResult(_ item: (CountType: CountType, action:ActionStep)) {
        for i in 0...report.count-1 {
            if report[i].countType == item.CountType {
                if item.action == .Kept {
                    report[i].keptCount = report[i].keptCount + 1
                } else if item.action == .Applied {
                    report[i].appliecCount = report[i].appliecCount + 1
                }
            }
        }
    }
}

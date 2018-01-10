//
//  Reader.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/15.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import CSV

class Report_general {
    
    static let shared = Report_general()
    private var data = [DataUnit]()
    var report = [ReportUnit]()
    
    init() {
        data = Util.read()
        
        data.sort { (a, b) -> Bool in
            return b.time.timeIntervalSince(a.time) >= 0
        }
        
        report = Util.generateReport_ObserveDetailResultCountAndAmbiguousConditionType()
    }
    
    func observe() {
        print("start observe!")
        
        var observingUsers = [String: (DataType, ActionStep, Date)]()
        
        while !data.isEmpty {
            let item = data.first!
            
            guard let uuid = item.uuid, !uuid.isEmpty, item.version == "タウンワーク4.49.0" else {
                data.removeFirst()
                continue
            }
            
            let nowAction = Util.dataUnitActionStep(dataUnit: item)
            if nowAction == .Others {
                observingUsers.removeValue(forKey: uuid)
                data.removeFirst()
                continue
            }
            
            observingUsers = removeExpiredObservingUser(observingUser: observingUsers, time: item.time)
            
            switch nowAction {
            case .CheckedSearchList:
                let dataType = DataType(item)
                if dataType.countType == .NotAvaliable {
                    data.removeFirst()
                    continue
                }
                if let existingUser = observingUsers[uuid] {
                    var type = existingUser.0
                    type.countType = CountType.preferentialCountType(beforeType: existingUser.0.countType, afterType: dataType.countType)
                    observingUsers[item.uuid!] = (type, nowAction, item.time)
                } else{
                    observingUsers[item.uuid!] = (dataType, nowAction, item.time)
                    addNewTotal(datatype: dataType)
                }
                data.removeFirst()
            case .Kept:
                if let existingUser = observingUsers[uuid], Util.isForwardAction(beforeAction: existingUser.1, afterAction: nowAction) {
                    addNewResult(item: (existingUser.0, nowAction))
                    observingUsers[item.uuid!] = (existingUser.0, nowAction, item.time)
                }
                data.removeFirst()
            case .CheckedDetail, .Applying:
                if let existingUser = observingUsers[uuid], Util.isForwardAction(beforeAction: existingUser.1, afterAction: nowAction) {
                    observingUsers[item.uuid!] = (existingUser.0, nowAction, item.time)
                }
                data.removeFirst()
            case .Applied:
                if let existingUser = observingUsers[uuid], Util.isForwardAction(beforeAction: existingUser.1, afterAction: nowAction) {
                    addNewResult(item: (existingUser.0, nowAction))
                    observingUsers.removeValue(forKey: uuid)
                }
                data.removeFirst()
            default:
                data.removeFirst()
                continue
            }
        }
        for item in report {
            print(item)
        }
//        Util.write(data: targetData, to: "twn_1204-1210_com.csv")
    }
    
    private func removeExpiredObservingUser(observingUser: [String: (DataType, ActionStep, Date)], time: Date) -> [String: (DataType, ActionStep, Date)] {
        var observingUser = observingUser
        for item in observingUser {
            if time.timeIntervalSince(item.value.2) > 1200 {
                observingUser.removeValue(forKey: item.key)
            }
        }
        return observingUser
    }
    
    private func addNewTotal(datatype: DataType) {
        for i in 0...report.count-1 {
            if report[i].dataType.isEqual(targetType: datatype) {
                report[i].totalNum = report[i].totalNum + 1
            }
        }
    }
    private func addNewResult(item: (datatype: DataType, action:ActionStep)) {
        for i in 0...report.count-1 {
            if report[i].dataType.isEqual(targetType: item.datatype) {
                if item.action == .Kept {
                    report[i].endWithKept = report[i].endWithKept + 1
                } else if item.action == .Applied {
                    report[i].endWithApplied = report[i].endWithApplied + 1
                }
            }
        }
    }
}

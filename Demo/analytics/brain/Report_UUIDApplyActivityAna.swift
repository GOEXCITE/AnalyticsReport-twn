//
//  Report_UUIDApplyActivityAna.swift
//  Demo
//
//  Created by 田　甜 on 2018/09/21.
//  Copyright © 2018年 田　甜. All rights reserved.
//

import Foundation
import CSV

fileprivate enum UUIDApplyActivityType: String {
    case sc, detail, apply, keep, exceptionPreDetailPage
    init?(strValue: String) {
        if strValue == "求人情報一覧画面起動" {
            self = .sc
        } else if strValue == "求人情報詳細画面起動" {
            self = .detail
        } else if strValue == "WEB応募完了ページ表示" {
            self = .apply
        } else if strValue == "keep" {
            self = .keep
        } else if strValue == "写真画面起動" || strValue == "地図詳細画面起動" || strValue == "WEB応募開始ページ表示" {
            self = .exceptionPreDetailPage
        } else {
            return nil
        }
    }
}

fileprivate let sigmoidLambda = 0.0005

class Report_UUIDApplyActivityAna {
    
    private let csvPath = "/Users/01011776/workspace/Analytics-twn/data/bq_20180820-0919/20180820-0919_uuid_activity_10000.csv"
    private let opCsvPath1 = "/Users/01011776/workspace/Analytics-twn/data/bq_20180820-0919/20180820-0919_uuid_activity_10000_output1_rqmtId.csv"
    private let opCsvPath2 = "/Users/01011776/workspace/Analytics-twn/data/bq_20180820-0919/20180820-0919_uuid_activity_10000_output2_uuidSC.csv"
    
    fileprivate var csvWriter1: CSVWriter
    fileprivate var csvWriter2: CSVWriter
    
    private var count = 0
    
    init() {
        let outputFilePath1 = opCsvPath1
        let stream1 = OutputStream(toFileAtPath: outputFilePath1, append: true)!
        csvWriter1 = try! CSVWriter(stream: stream1)
        
        try! csvWriter1.write(row: ["rqmtId",
                                   "keptTime",
                                   "appliedTime",
                                   "detailCheckedCount",
                                   "sigmoidValue_",
                                   "appliedFlg"])
        
        let outputFilePath2 = opCsvPath2
        let stream2 = OutputStream(toFileAtPath: outputFilePath2, append: true)!
        csvWriter2 = try! CSVWriter(stream: stream2)

        try! csvWriter2.write(row: ["uuid",
                                    "scBody",
                                    "rqmtIdCountWithDetail",
                                    "rqmtIdCountWithKept",
                                    "hasArea",
                                    "hasAlongRailWay",
                                    "hasGps",
                                    "hasAAG",
                                    "hasJobType",
                                    "hasKodawari",
                                    "hasSalary",
                                    "hasHireType",
                                    "scLTypeCount",
                                    "scLength",
                                    "scWithinApplied",
                                    "uuidApplied"])
    }
    
    func start() {
        print(Date())
        read()
        csvWriter1.stream.close()
        csvWriter2.stream.close()
        print(Date())
    }
    
    fileprivate func read() {
        do {
            let stream = InputStream(fileAtPath: csvPath)!
            let csv = try CSVReader(stream: stream)
            //            let csv = try CSVReader(stream: stream,
            //                                    hasHeaderRow: true,
            //                                    trimFields: false,
            //                                    delimiter: ",",
            //                                    whitespaces: CSVReader.defaultWhitespaces)
            
            var currentUUID = ""
            var itemsFromSameUUID = [Outform20180921]()
            
            while let row = csv.next() {
                if row.count != 26 {
                    print("invilid row!!!")
                    continue
                }
                
                if row[1].isEmpty {
                    continue
                }
                if row[2].isEmpty {
                    continue
                }
                
                var type: UUIDApplyActivityType?
                
                type = UUIDApplyActivityType(strValue: row[5])
                
                if type == nil && row[25] == "1" {
                    type = UUIDApplyActivityType(strValue: "keep")
                }
                
                guard let rType = type else {
                    continue
                }
                
                var item = Outform20180921(rType)
                item.setup(with: row)
                
                if item.type == .sc {
                    if item.todoufukenId!.isEmpty && item.areaId!.isEmpty {
                        print("warning: 検索条件は大エリア情報はない")
                        continue
                    }
                }
                
                if item.uuid == currentUUID {
                    itemsFromSameUUID.append(item)
                } else {
                    if count > 1000 {
                        break
                    }
                    count += 1
                    aggregateSameUUID(itemsFromSameUUID)
                    currentUUID = item.uuid
                    itemsFromSameUUID = [Outform20180921]()
                    itemsFromSameUUID.append(item)
                }
            }
        } catch let err as NSError {
            print(err)
        }
    }
    
    private func aggregateSameUUID(_ items: [Outform20180921]) {
        if items.isEmpty {
            return
        }
        var rqmtIdItems = [String: RqmtIdOutputForm]() // rqmtid: item
        var scItems = [String: UUIDSCOutputForm]()  //scString: item
        var isFromExceptionPreDetailPage = false
        var mostRecentSC = ""
        var lastTime = items.first!.time!
        
        for item in items {
            lastTime = item.time
            switch item.type {
            case .sc:
                let scStr = coverSearchConditionToString(item: item)
                mostRecentSC = scStr
                if scItems[scStr] == nil {
                    scItems[scStr] = UUIDSCOutputForm(item: item, scStr: scStr)
                }
                isFromExceptionPreDetailPage = false
            case .detail, .apply, .keep:
                if item.type == .detail && isFromExceptionPreDetailPage {
                    isFromExceptionPreDetailPage = false
                    continue
                }

                if var existing = rqmtIdItems[item.rqmtId!] {
                    existing.update(with: item)
                    rqmtIdItems[item.rqmtId!] = existing
                } else {
                    rqmtIdItems[item.rqmtId!] = RqmtIdOutputForm(item: item)
                }
                
                if item.type == .detail, var sc = scItems[mostRecentSC] {
                    sc.rqmtIdCountWithDetail += 1
                    scItems[mostRecentSC] = sc
                }
                if item.type == .keep, var sc = scItems[mostRecentSC] {
                    sc.rqmtIdCountWithKept += 1
                    scItems[mostRecentSC] = sc
                }
                if item.type == .apply {
                    for t in scItems {
                        scItems[t.key]!.uuidApplied = true
                    }
                    scItems[mostRecentSC]?.scWithinApplied = true
                }
                
                isFromExceptionPreDetailPage = false
            case .exceptionPreDetailPage:
                isFromExceptionPreDetailPage = true
            }
        }
        
        for (_, var item) in rqmtIdItems.values.enumerated() {
            item.calculateDetailInfos(timeUsedForNotApplied: lastTime)
            writeRqmtIdFormData(item)
        }
        for (_, item) in scItems.values.enumerated() {
            writeUUIDSCFormData(item)
        }
    }
    
    private struct RqmtIdOutputForm {
        var rqmtId = ""
        var keptTimeStr = ""
        var keptTimeDate: Date?
        var appliedTimeStr = ""
        var appliedTimeDate: Date?
        var keepApplyTimeSpan = 0
        var detailChckedTimes = [Date]()
        var detailCheckedCount = 0
        var detailSigmoidValue = 0.0
        var appliedFlg = false
        
        init(item: Outform20180921) {
            rqmtId = item.rqmtId!
            switch item.type {
            case .detail:
                detailChckedTimes.append(item.time)
            case .keep:
                keptTimeDate = item.time
                keptTimeStr = "\(item.time!)"
            case .apply:
                appliedTimeDate = item.time
                appliedTimeStr = "\(item.time!)"
                appliedFlg = true
                if let keptTime = keptTimeDate {
                    keepApplyTimeSpan = Int(appliedTimeDate!.timeIntervalSince(keptTime))
                }
            default:
                return
            }
        }
        
        mutating func update(with item: Outform20180921) {
            if appliedFlg {
                return
            }
            switch item.type {
            case .detail:
                detailChckedTimes.append(item.time)
            case .keep:
                keptTimeDate = item.time
                keptTimeStr = "\(item.time)"
            case .apply:
                appliedTimeDate = item.time
                appliedTimeStr = "\(item.time)"
                appliedFlg = true
                if let keptTime = keptTimeDate {
                    keepApplyTimeSpan = Int(appliedTimeDate!.timeIntervalSince(keptTime))
                }
            default:
                return
            }
        }
        
        mutating func calculateDetailInfos(timeUsedForNotApplied: Date) {
            // detailCheckedCount
            detailCheckedCount = detailChckedTimes.count
            
            // detailSigmoidValue
            var time = timeUsedForNotApplied
            if let t = appliedTimeDate {
                time = t
            }
            
            for pastTime in detailChckedTimes {
                detailSigmoidValue = detailSigmoidValue + sigmoidFunction(value: Int(time.timeIntervalSince(pastTime)))
            }
        }
        
        private func sigmoidFunction(value: Int) -> Double {
            var result = 0.0
            result = -sigmoidLambda * Double(value/60)
            result = pow(Double(2.718), result)
            result = 2.0 / (1.0 + result) - 1
            result = 1 - result
            return result
        }
    }
    
    private func writeRqmtIdFormData(_ item: RqmtIdOutputForm) {
        csvWriter1.beginNewRow()
        try! csvWriter1.write(field: item.rqmtId)
        try! csvWriter1.write(field: item.keptTimeStr)
        try! csvWriter1.write(field: item.appliedTimeStr)
        try! csvWriter1.write(field: "\(item.detailCheckedCount)")
        try! csvWriter1.write(field: "\(item.detailSigmoidValue)")
        try! csvWriter1.write(field: "\(item.appliedFlg)")
    }
    
    private struct UUIDSCOutputForm {
        var uuid = ""
        var scBody = ""
        var rqmtIdCountWithDetail = 0
        var rqmtIdCountWithKept = 0
        var hasArea = false
        var hasAlongRailWay = false
        var hasGps = false
        var hasAAG = false
        var hasJobType = false
        var hasKodawari = false
        var hasSalary = false
        var hasHireType = false
        var scLTypeCount = 0
        var scLength = 0
        var scWithinApplied = false
        var uuidApplied = false
        
        init(item: Outform20180921, scStr: String) {
            uuid = item.uuid
            scBody = scStr
            var count = 0
            hasArea = scHasArea(item)
            hasAlongRailWay = scHasAlongRailWay(item)
            hasGps = scHasGps(item)
            hasAAG = hasArea || hasAlongRailWay || hasGps
            count = hasAAG ? count + 1 : count
            hasJobType = scHasJobType(item)
            count = hasJobType ? count + 1 : count
            hasKodawari = scHasKodawari(item)
            count = hasKodawari ? count + 1 : count
            hasSalary = scHasSalary(item)
            count = hasSalary ? count + 1 : count
            hasHireType = scHasHireType(item)
            count = hasHireType ? count + 1 : count
            scLTypeCount = count
            scLength = scStr.characters.count
        }
        
        private func scHasArea(_ item: Outform20180921) -> Bool {
            return !item.mArea!.isEmpty || !item.sArea!.isEmpty
        }
        
        private func scHasAlongRailWay(_ item: Outform20180921) -> Bool {
            return !item.alongRailCd!.isEmpty || !item.stationUnitCd!.isEmpty
        }
        
        private func scHasGps(_ item: Outform20180921) -> Bool {
            return !item.gpsRange!.isEmpty
        }
        
        private func scHasJobType(_ item: Outform20180921) -> Bool {
            return !item.lJobTypeCd!.isEmpty || !item.mJobTypeCd!.isEmpty
        }
        
        private func scHasKodawari(_ item: Outform20180921) -> Bool {
            return !item.meritCd!.isEmpty
        }
        
        private func scHasSalary(_ item: Outform20180921) -> Bool {
            return !item.salaryUnitCd!.isEmpty && !item.salaryRangeCd!.isEmpty
        }
        
        private func scHasHireType(_ item: Outform20180921) -> Bool {
            return !item.hireType!.isEmpty
        }
    }

    private func writeUUIDSCFormData(_ item: UUIDSCOutputForm) {
        csvWriter2.beginNewRow()
        try! csvWriter2.write(field: item.uuid)
        try! csvWriter2.write(field: item.scBody)
        try! csvWriter2.write(field: "\(item.rqmtIdCountWithDetail)")
        try! csvWriter2.write(field: "\(item.rqmtIdCountWithKept)")
        try! csvWriter2.write(field: "\(item.hasArea)")
        try! csvWriter2.write(field: "\(item.hasAlongRailWay)")
        try! csvWriter2.write(field: "\(item.hasGps)")
        try! csvWriter2.write(field: "\(item.hasAAG)")
        try! csvWriter2.write(field: "\(item.hasJobType)")
        try! csvWriter2.write(field: "\(item.hasKodawari)")
        try! csvWriter2.write(field: "\(item.hasSalary)")
        try! csvWriter2.write(field: "\(item.hasHireType)")
        try! csvWriter2.write(field: "\(item.scLTypeCount)")
        try! csvWriter2.write(field: "\(item.scLength)")
        try! csvWriter2.write(field: "\(item.scWithinApplied)")
        try! csvWriter2.write(field: "\(item.uuidApplied)")
    }
    
    private func coverSearchConditionToString(item: Outform20180921) -> String {
        if item.mArea!.isEmpty &&
            item.sArea!.isEmpty &&
            item.lJobTypeCd!.isEmpty &&
            item.mJobTypeCd!.isEmpty &&
            item.alongRailCd!.isEmpty &&
            item.stationUnitCd!.isEmpty &&
            item.meritCd!.isEmpty &&
            item.hireType!.isEmpty &&
            item.salaryUnitCd!.isEmpty &&
            item.salaryRangeCd!.isEmpty &&
            item.gpsRange!.isEmpty {
            return "_"
        }
        var result = item.todoufukenId!
        if let t = item.areaId, !t.isEmpty {
            result = result + "_" + t
        }
        if let t = item.mArea, !t.isEmpty {
            result = result + "_" + t
        }
        if let t = item.sArea, !t.isEmpty {
            result = result + "_" + t
        }
        if let t = item.lJobTypeCd, !t.isEmpty {
            result = result + "_" + t
        }
        if let t = item.mJobTypeCd, !t.isEmpty {
            result = result + "_" + t
        }
        if let t = item.alongRailCd, !t.isEmpty {
            result = result + "_" + t
        }
        if let t = item.stationUnitCd, !t.isEmpty {
            result = result + "_" + t
        }
        if let t = item.meritCd, !t.isEmpty {
            result = result + "_" + t
        }
        if let t = item.hireType, !t.isEmpty {
            result = result + "_" + t
        }
        if let t = item.salaryUnitCd, !t.isEmpty {
            result = result + "_" + t
        }
        if let t = item.salaryRangeCd, !t.isEmpty {
            result = result + "_" + t
        }
        if let t = item.gpsRange, !t.isEmpty {
            result = result + "_" + t
        }
        return result
    }
}

fileprivate struct Outform20180921 {
    
    var type: UUIDApplyActivityType
    
    var time : Date!
    var uuid : String!
    var page: String?
    var visitNumber: String?
    
    var eventPage: String?
    
    var areaId: String?
    var todoufukenId: String?
    var mArea : String?
    var sArea : String?
    
    var lJobTypeCd : String?
    var mJobTypeCd : String?
    
    var alongRailCd : String?
    var stationUnitCd : String?
    var meritCd : String?
    var hireType : String?
    var salaryUnitCd : String?
    var salaryRangeCd : String?
    
    var gpsRange : String?
    
    var applyGender : String?
    var applyBirth : String?
    var applyJob : String?
    
    var keepEvent: String?
    var rqmtId: String?
    
    init(_ aType: UUIDApplyActivityType) {
        type = aType
    }
    
    mutating func setup(with row: [String]) {
        uuid = row[1]
        time = row[2].adobeDate()
        page = row[5]
        eventPage = row[7]
        areaId = row[8]
        todoufukenId = row[9]
        mArea = row[10]
        sArea = row[11]
        lJobTypeCd = row[12]
        mJobTypeCd = row[13]
        alongRailCd = row[14]
        stationUnitCd = row[15]
        meritCd = row[16]
        hireType = row[17]
        salaryUnitCd = row[18]
        salaryRangeCd = row[19]
        gpsRange = row[20]
        applyGender = row[21]
        applyBirth = row[22]
        applyJob = row[23]
        rqmtId = row[24]
        keepEvent = row[25]
    }
}

//
//  Report_CheckedRqmtIdNumber.swift
//  Demo
//
//  Created by 田　甜 on 2018/09/07.
//  Copyright © 2018年 田　甜. All rights reserved.
//

import Foundation
import CSV

// time sort
// remove tmp data

// 追加パラ：sc length
enum ItemType: String {
    case sc, detail, apply, keep, keeplist, historylist
}
class Report_CheckedRqmtIdNumber {
    private static let dateRange = "20180828-28"
    private static let outputFolder = "20180828_ana"
    private let csvPath = "/Users/01011776/workspace/Analytics-twn/data/_rawdataset/f1/twn_" + dateRange + "_raw.csv"
    private let opCsvPath = "/Users/01011776/workspace/Analytics-twn/data/" + outputFolder + "/twn_" + dateRange + "_output1.csv"
    
    fileprivate var csvWriter: CSVWriter
    
    private var count = 0
    
    init() {
        let outputFilePath = opCsvPath
        let stream = OutputStream(toFileAtPath: outputFilePath, append: true)!
        csvWriter = try! CSVWriter(stream: stream)
        
        
        try! csvWriter.write(row: ["uuid",
                                   "visitNumber",
                                   "time",
                                   "content",
                                   "location",
                                   "type"])
    }
    
    func start() {
        print(Date())
        read()
        csvWriter.stream.close()
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

            while let row = csv.next() {
                if row.count < 23 {
                    print("invilid row!!!")
                    continue
                }
                if row[0].isEmpty {
                    continue
                }
                if row[1].isEmpty {
                    continue
                }
                let checkPage = row[2] == "求人情報一覧画面起動" ||
                    row[2] == "求人情報詳細画面起動" ||
                    row[2] == "WEB応募完了ページ表示" ||
                    row[2] == "キープリスト画面起動" ||
                    row[2] == "閲覧履歴画面起動" ||
                    row[22] == "1"

                if !checkPage {
                    continue
                }
                
                //
//                if count > 1000 {
//                    break
//                }
//                count += 1
                
                var item = Model20180907()
                item.uuid = row[0]
                item.time = row[1].adobeDate()
                item.page = row[2]
                item.visitNumber = row[3]
                item.eventPage = row[4]
                item.areaId = row[5]
                item.todoufukenId = row[6]
                item.mArea = row[7]
                item.sArea = row[8]
                item.lJobTypeCd = row[9]
                item.mJobTypeCd = row[10]
                item.alongRailCd = row[11]
                item.stationUnitCd = row[12]
                item.meritCd = row[13]
                item.hireType = row[14]
                item.salaryUnitCd = row[15]
                item.salaryRangeCd = row[16]
                item.gpsRange = row[17]
                item.applyGender = row[18]
                item.applyBirth = row[19]
                item.applyJob = row[20]
                item.rqmtId = row[21]
                item.keepEvent = row[22]
                check(item)
            }
        } catch let err as NSError {
            print(err)
        }
    }
    
    private func check(_ item: Model20180907) {
        if item.page == "求人情報一覧画面起動" {
            if item.todoufukenId!.isEmpty || item.areaId!.isEmpty {
                print("warning: 検索条件は大エリア情報はない")
                return
            }
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
                return
            }
            addNewSCToMidFiles(item)
        } else if item.page == "求人情報詳細画面起動" && !item.rqmtId!.isEmpty {
            addNewDetailToMidFiles(item)
        } else if item.page == "WEB応募完了ページ表示" && !item.rqmtId!.isEmpty {
            addNewApplyToMidFiles(item)
        } else if item.page == "キープリスト画面起動" {
            addNewKeepListToMidFiles(item)
        } else if item.page == "閲覧履歴画面起動" {
            addNewHistoryListToMidFiles(item)
        } else if item.keepEvent == "1" {
            addNewKeepToMidFiles(item)
        }
    }
    
    private func addNewSCToMidFiles(_ item: Model20180907) {
        var output = Model20180907Output(ItemType.sc)
        output.uuid = item.uuid
        output.visitNumber = item.visitNumber ?? ""
        output.time = "\(item.time!)"
        output.content = coverSearchConditionToString(item: item)
        writeData(item: output)
    }
    
    private func addNewDetailToMidFiles(_ item: Model20180907) {
        var output = Model20180907Output(ItemType.detail)
        output.uuid = item.uuid
        output.visitNumber = item.visitNumber ?? ""
        output.time = "\(item.time!)"
        output.content = item.rqmtId!
        writeData(item: output)
    }
    
    private func addNewApplyToMidFiles(_ item: Model20180907) {
        var output = Model20180907Output(ItemType.apply)
        output.uuid = item.uuid
        output.visitNumber = item.visitNumber ?? ""
        output.time = "\(item.time!)"
        output.content = item.rqmtId!
        writeData(item: output)
    }
    
    private func addNewKeepListToMidFiles(_ item: Model20180907) {
        var output = Model20180907Output(ItemType.keeplist)
        output.uuid = item.uuid
        output.visitNumber = item.visitNumber ?? ""
        output.time = "\(item.time!)"
        writeData(item: output)
    }
    
    private func addNewHistoryListToMidFiles(_ item: Model20180907) {
        var output = Model20180907Output(ItemType.historylist)
        output.uuid = item.uuid
        output.visitNumber = item.visitNumber ?? ""
        output.time = "\(item.time!)"
        writeData(item: output)
    }
    
    private func addNewKeepToMidFiles(_ item: Model20180907) {
        var output = Model20180907Output(ItemType.keep)
        output.uuid = item.uuid
        output.visitNumber = item.visitNumber ?? ""
        output.time = "\(item.time!)"
        output.content = item.rqmtId!
        output.location = item.eventPage!
        writeData(item: output)
    }
    
    private func isSameSearchCondition(a: Model20180907, b: Model20180907) -> Bool {
        return false
    }
    
    private func coverSearchConditionToString(item: Model20180907) -> String {
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
    
    fileprivate func writeData(item: Model20180907Output) {
        csvWriter.beginNewRow()
        try! csvWriter.write(field: item.uuid)
        try! csvWriter.write(field: item.visitNumber)
        try! csvWriter.write(field: item.time)
        try! csvWriter.write(field: item.content)
        try! csvWriter.write(field: item.location)
        try! csvWriter.write(field: item.type.rawValue)
    }
}

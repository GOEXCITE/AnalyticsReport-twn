//
//  Reader.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/15.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation
import CSV

class Util {
    
    private static let DateFormat = "yyyy/MM/dd HH:mm:ss"
    
    private static let pathProcessing = "/Users/01011776/workspace/Analytics-twn/data/processing/"
    
    static func adobeDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Util.DateFormat
        return dateFormatter
    }
    
    static func read() -> [DataUnit] {
        var allItems = [DataUnit]()
        do {
            let url = URL(fileURLWithPath: FilePath)
            let csvStr = try String(contentsOf: url, encoding: String.Encoding.utf8)
            let csv = try! CSVReader(string: csvStr)
            
            while let row = csv.next() {
                let item = DataUnit()
                item.version = row[0]
                item.time = row[1].adobeDate()
                item.uuid = row[2]
                item.mArea = row[3]
                item.sArea = row[4]
                item.lJobTypeCd = row[5]
                item.mJobTypeCd = row[6]
//                item.showDetailImage = row[7]
                item.alongRailCd = row[7]
                item.stationUnitCd = row[8]
                item.meritCd = row[9]
                item.hireType = row[10]
                item.salaryUnitCd = row[11]
                item.salaryRangeCd = row[12]
                item.searchResultCount = row[13]
                item.eventPageName = row[14]
                item.pageViews = row[15]
                item.addKeepAction = row[16]
//                item.telApplyButtonTappedEvent = row[16]
//                item.webApplyStartEvent = row[17]
//                item.webApplyComfirmEvent = row[18]
//                item.webApplyFinishedEvent = row[19]
//                item.webApplyButtonTappedEvent = row[20]
//                item.webApplyTotalCountEvent = row[21]
                allItems.append(item)
            }
        } catch let err as NSError {
            print(err)
        }
        return allItems
    }
    
    static func write(data: [DataUnit], to fileName: String) {
        let stream = OutputStream(toFileAtPath: "\(pathProcessing)\(fileName)", append: true)!
        let csv = try! CSVWriter(stream: stream)
        
        try! csv.write(row: ["アプリ名&バージョン_e11",
                             "タイムスタンプ_p46",
                             "UUID",
                             "中エリアcd_e54",
                             "小エリアcd",
                             "大職種cd_e57",
                             "中職種cd_e58",
                             "沿線cd_e60",
                             "駅包括cd_e61",
                             "こだわりcd_e62",
                             "雇用形態cd_e63",
                             "給与単位cd_e64",
                             "給与範囲cd_e65",
                             "searchResultCount_p48",
                             "イベントページ名_e29",
                             "PageViews",
                             "キープリストに追加_8"])
        
        for item in data {
            csv.beginNewRow()
            try! csv.write(field: item.version!)
            try! csv.write(field: item.time.description)
            try! csv.write(field: item.uuid!)
            try! csv.write(field: item.mArea!)
            try! csv.write(field: item.sArea!)
            try! csv.write(field: item.lJobTypeCd!)
            try! csv.write(field: item.mJobTypeCd!)
//            try! csv.write(field: item.showDetailImage!)
            try! csv.write(field: item.alongRailCd!)
            try! csv.write(field: item.stationUnitCd!)
            try! csv.write(field: item.meritCd!)
            try! csv.write(field: item.hireType!)
            try! csv.write(field: item.salaryUnitCd!)
            try! csv.write(field: item.salaryRangeCd!)
            try! csv.write(field: item.searchResultCount!)
            try! csv.write(field: item.eventPageName!)
            try! csv.write(field: item.pageViews!)
            try! csv.write(field: item.addKeepAction!)
//            try! csv.write(field: item.telApplyButtonTappedEvent!)
//            try! csv.write(field: item.webApplyStartEvent!)
//            try! csv.write(field: item.webApplyComfirmEvent!)
//            try! csv.write(field: item.webApplyFinishedEvent!)
//            try! csv.write(field: item.webApplyButtonTappedEvent!)
//            try! csv.write(field: item.webApplyTotalCountEvent!)
        }
        csv.stream.close()
    }
}

extension String {
    func adobeDate() -> Date {
        if self.contains("タイムスタンプ_p46") {
            return Date(timeIntervalSince1970: 0)
        }
        return Util.adobeDateFormatter().date(from: self)!
    }
}

//
//  Report_CheckedRqmtIdNumberNext.swift
//  Demo
//
//  Created by 田　甜 on 2018/09/07.
//  Copyright © 2018年 田　甜. All rights reserved.
//

import Foundation
import CSV

// 追加パラ：uuidのappliedかどうかの情報,詳細閲覧数、キープしたかどうか、応募した原稿は一覧からかキープからか閲覧履歴からか
// 別シート：検索条件数、一覧表示回数、sc length average、短期かどうか、応募したかどうか、何回応募したか、何回キープしたか

class Report_CheckedRqmtIdAndSegment {
    private static let folderName = "20180827-0902_ana"
    private static let dateRange = "20180827-0902"
    private let csvPath = "/Users/01011776/workspace/Analytics-twn/data/" + folderName + "/twn_" + dateRange + "_output1.csv"
    private let opCsvPath2 = "/Users/01011776/workspace/Analytics-twn/data/" + folderName + "/twn_" + dateRange + "_output2_oubo.csv"
    private let opCsvPath3 = "/Users/01011776/workspace/Analytics-twn/data/" + folderName + "/twn_" + dateRange + "_output3_segment.csv"
    
    fileprivate var csvWriter2: CSVWriter
    fileprivate var csvWriter3: CSVWriter
    
    var count = 0
    
    init() {
        let outputFilePath2 = opCsvPath2
        let stream2 = OutputStream(toFileAtPath: outputFilePath2, append: true)!
        csvWriter2 = try! CSVWriter(stream: stream2)

        try! csvWriter2.write(row: ["uuid",
                                   "rqmtId",
                                   "detailCheckedCount",
                                   "kept",
                                   "rqmtIdApplied",
                                   "ifRqmtIdApplied_detailPageFrom",
                                   "uuidApplied"])
        
        let outputFilePath3 = opCsvPath3
        let stream3 = OutputStream(toFileAtPath: outputFilePath3, append: true)!
        csvWriter3 = try! CSVWriter(stream: stream3)
        
        try! csvWriter3.write(row: ["uuid",
                                    "uuidApplied",
                                    "scCount",
                                    "scAverageLength",
                                    "resultListPageCount",
                                    "isTanki",
                                    "appliedCount",
                                    "keptCount"])
    }
    
    func start() {
        print(Date())
        read()
        csvWriter2.stream.close()
        csvWriter3.stream.close()
        print(Date())
    }
    
    fileprivate func read() {
        var nowUuid = ""
        var itemsForSameUUID = [Model20180907Output]()
        do {
            let stream = InputStream(fileAtPath: csvPath)!
//            let csv = try CSVReader(stream: stream)
            let csv = try CSVReader.init(stream: stream,
                                         hasHeaderRow: true,
                                         trimFields: false,
                                         delimiter: ",",
                                         whitespaces: CSVReader.defaultWhitespaces)
            while let row = csv.next() {
                
                if row[0] == nowUuid {
                    if row[5].isEmpty {
                        print("type could not be empty!!")
                        continue
                    }
                    itemsForSameUUID.append(createModelOutputItem(row)!)
                } else {
                    dealTmpItems(itemsForSameUUID)
                    
//                    if count > 200 {
//                        break
//                    }
//                    count = count + 1
                    
                    nowUuid = row[0]
                    itemsForSameUUID = [Model20180907Output]()
                    itemsForSameUUID.append(createModelOutputItem(row)!)
                }
            }
        } catch let err as NSError {
            print(err)
        }
    }
    
    private func createModelOutputItem(_ row: [String]) -> Model20180907Output? {
        if let type = ItemType(rawValue: row[5]) {
            var item = Model20180907Output(type)
            item.uuid = row[0]
            item.visitNumber = row[1]
            item.content = row[3]
            item.location = row[4]
            return item
        }
        return nil
    }
    
    private func dealTmpItems(_ tItems: [Model20180907Output]) {
        if tItems.isEmpty {
            return
        }

        let uuid = tItems.first!.uuid
        var uuidApplied = false
        var uuidAppliedCount = 0
        var uuidKeptCount = 0
        
        var items = tItems
        
        while !items.isEmpty {
            
            // index of "detail", "apply", "keep"
            guard let tIndex = items.index(where: { (aItem) -> Bool in
                return aItem.type != .sc && !aItem.content.isEmpty
            }) else {
                break
            }
            
            let rqmtid = items[tIndex].content
            
            var rqmtIdDetailCheckedCount = 0
            var rqmtIdApplied = false
            var rqmtIdKept = false
            var rqmtIdFromPage = ""
            var nextItems = [Model20180907Output]()
            var hasExceptionPreDetailPage = false
            
            for i in 0...items.count-1 {
                
                let tItem = items[i]
                
                switch tItem.type {
                case .exceptionPreDetailPage:
                    hasExceptionPreDetailPage = true
                case .detail:
                    if tItem.content == rqmtid {
                        if !hasExceptionPreDetailPage {
                            rqmtIdDetailCheckedCount += 1
                        }
                        hasExceptionPreDetailPage = false
                    } else {
                        nextItems.append(tItem)
                    }
                case .apply:
                    hasExceptionPreDetailPage = false
                    if tItem.content == rqmtid {
                        rqmtIdApplied = true
                        uuidApplied = true
                        uuidAppliedCount += 1
                    } else {
                        nextItems.append(tItem)
                    }
                case .keep:
                    hasExceptionPreDetailPage = false
                    if tItem.content == rqmtid {
                        rqmtIdKept = true
                        uuidKeptCount += 1
                    } else {
                        nextItems.append(tItem)
                    }
                case .keeplist, .historylist:
                    hasExceptionPreDetailPage = false
                    rqmtIdFromPage = tItem.type.rawValue
                    nextItems.append(tItem)
                case .sc:
                    hasExceptionPreDetailPage = false
                    rqmtIdFromPage = "sc"
                    nextItems.append(tItem)
                }
            }
            
            writeUserRqmtIdData(uuid: uuid,
                                rqmtId: rqmtid,
                                detailCheckedCount: rqmtIdDetailCheckedCount,
                                kept: rqmtIdKept,
                                rqmtIdApplied: rqmtIdApplied,
                                ifRqmtIdApplied_detailPageFrom: rqmtIdFromPage,
                                uuidApplied: uuidApplied)
            
            items = nextItems
        }
        
        var scs = [Model20180907Output]()
//        var restItems = [Model20180907Output]()
        for item in items {
            if item.type == .sc {
                scs.append(item)
            }
        }
        
        if scs.isEmpty {
            writeSegmentData(uuid: uuid,
                             uuidApplied: uuidApplied,
                             scCount: 0,
                             scAverageLength: 0,
                             resultListPageCount: 0,
                             isTanki: false,
                             appliedCount: uuidAppliedCount,
                             keptCount: uuidKeptCount)
        } else {
            
            var allLength = 0
            // 短期：0052
            var isTanki = false
            
            var uniqueSCStrings = Set<String>()
            for item in scs {
                uniqueSCStrings.insert(item.content)
                allLength += item.content.characters.count
                isTanki = item.content.contains("0052") ? true : isTanki
            }
            
            writeSegmentData(uuid: uuid,
                             uuidApplied: uuidApplied,
                             scCount: uniqueSCStrings.count,
                             scAverageLength: allLength / scs.count,
                             resultListPageCount: scs.count,
                             isTanki: isTanki,
                             appliedCount: uuidAppliedCount,
                             keptCount: uuidKeptCount)
        }
    }
        
    
    fileprivate func writeUserRqmtIdData(uuid: String,
                                         rqmtId: String,
                                         detailCheckedCount: Int,
                                         kept:Bool,
                                         rqmtIdApplied: Bool,
                                         ifRqmtIdApplied_detailPageFrom: String,
                                         uuidApplied:Bool) {
        csvWriter2.beginNewRow()
        try! csvWriter2.write(field: uuid)
        try! csvWriter2.write(field: rqmtId)
        try! csvWriter2.write(field: "\(detailCheckedCount)")
        try! csvWriter2.write(field: "\(kept)")
        try! csvWriter2.write(field: "\(rqmtIdApplied)")
        try! csvWriter2.write(field: ifRqmtIdApplied_detailPageFrom)
        try! csvWriter2.write(field: "\(uuidApplied)")
    }
    
    fileprivate func writeSegmentData(uuid: String, uuidApplied: Bool, scCount: Int, scAverageLength: Int, resultListPageCount: Int, isTanki: Bool, appliedCount: Int, keptCount: Int) {
        csvWriter3.beginNewRow()
        try! csvWriter3.write(field: uuid)
        try! csvWriter3.write(field: "\(uuidApplied)")
        try! csvWriter3.write(field: "\(scCount)")
        try! csvWriter3.write(field: "\(scAverageLength)")
        try! csvWriter3.write(field: "\(resultListPageCount)")
        try! csvWriter3.write(field: "\(isTanki)")
        try! csvWriter3.write(field: "\(appliedCount)")
        try! csvWriter3.write(field: "\(keptCount)")
    }
}

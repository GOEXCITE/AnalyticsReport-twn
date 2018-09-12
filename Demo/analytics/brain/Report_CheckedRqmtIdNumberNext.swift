//
//  Report_CheckedRqmtIdNumberNext.swift
//  Demo
//
//  Created by 田　甜 on 2018/09/07.
//  Copyright © 2018年 田　甜. All rights reserved.
//

import Foundation
import CSV

class Report_CheckedRqmtIdNumberNext_RqmtId {
    private let csvPath = "/Users/01011776/workspace/Analytics-twn/data/20180912/twn_20180827_output1.csv"
    private let opCsvPath = "/Users/01011776/workspace/Analytics-twn/data/20180912/twn_20180827_output2.csv"
    
    fileprivate var csvWriter: CSVWriter
    
    var count = 0
    
    init() {
        let outputFilePath = opCsvPath
        let stream = OutputStream(toFileAtPath: outputFilePath, append: true)!
        csvWriter = try! CSVWriter(stream: stream)
        
        try! csvWriter.write(row: ["uuid",
                                   "rqmtId",
                                   "checkedCount",
                                   "applied"])
    }
    
    func start() {
        print(Date())
        read()
        csvWriter.stream.close()
        print(Date())
    }
    
    fileprivate func read() {
        var nowUuid = ""
        var tmp = [Model20180907Output]()
        do {
            let stream = InputStream(fileAtPath: csvPath)!
            let csv = try CSVReader.init(stream: stream,
                                         hasHeaderRow: true,
                                         trimFields: false,
                                         delimiter: " ",
                                         whitespaces: CSVReader.defaultWhitespaces)
            while let row = csv.next() {
                if row[4] == "sc" {
                    continue
                }
//                if count > 100 {
//                    break
//                }
//                count = count + 1
                if row[0] == nowUuid {
                    var item = Model20180907Output()
                    item.uuid = row[0]
                    item.visitNumber = row[1]
                    item.content = row[3]
                    item.type = row[4]
                    tmp.append(item)
                } else {
                    dealTmpItems(tmp)
                    nowUuid = row[0]
                    tmp = [Model20180907Output]()
                }
            }
        } catch let err as NSError {
            print(err)
        }
    }
    
    private func dealTmpItems(_ items: [Model20180907Output]) {
        var items = items
        while !items.isEmpty {
            
            let first = items.first!
            
            var checked = 0
            var applied = false
            
            var indexs = [Int]()
            
            for i in 0...items.count-1 {
                if items[i].content != first.content {
                    continue
                }
                if items[i].type == "detail" {
                    checked += 1
                    indexs.append(i)
                } else if items[i].type == "apply" {
                    applied = true
                    indexs.append(i)
                }
            }
            
            writeData(uuid: first.uuid, rqmtId: first.content, checkedCount: checked, applied: applied)
            
            while !indexs.isEmpty {
                items.remove(at: indexs.last!)
                _ = indexs.removeLast()
            }
        }

    }
    
    fileprivate func writeData(uuid: String, rqmtId: String, checkedCount: Int, applied: Bool) {
        csvWriter.beginNewRow()
        try! csvWriter.write(field: uuid)
        try! csvWriter.write(field: rqmtId)
        try! csvWriter.write(field: "\(checkedCount)")
        try! csvWriter.write(field: "\(applied)")
    }
}

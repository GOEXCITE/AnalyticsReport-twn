//
//  Reform_all_actions.swift
//  Demo
//
//  Created by 田　甜 on 2018/04/11.
//  Copyright © 2018年 田　甜. All rights reserved.
//
// 1dデータ10hくらいかかる

import Foundation
import CSV

class Reform_all_actions {
    fileprivate let fileDic = "file:///Users/01011776/workspace/Analytics-twn/data/twn_all_event_20180331_2/split-files/"
    fileprivate let filePath = "/Users/01011776/workspace/Analytics-twn/data/twn_all_event_20180430/twn_action_0430.csv"
    fileprivate let filefilePathOutput = "/Users/01011776/workspace/Analytics-twn/data/twn_all_event_20180430_output/"
    
    fileprivate var csvWriter: CSVWriter
    
    init() {
        let outputFilePath = "\(filefilePathOutput)actionDataFile.csv"
        let stream = OutputStream(toFileAtPath: outputFilePath, append: true)!
        csvWriter = try! CSVWriter(stream: stream)
    }
    
    func start() {
        print("start time:\(Date().description)")
        let files = [filePath]//allFiles()

        try! csvWriter.write(row: ["uuid",
                             "time",
                             "actionCode",
                             "label",
                             "visitSegment",
                             "n'RQMT",
                             "checkedTimes",
                             "currentRqmtFrom"])
        
        for file in files {
            print("reading file: \(file)")
//            writeDerivedData(data: generateMedieData(url: file))
            var midData = generateMedieData(url: file)
            midData = midData.sorted { (a, b) -> Bool in
                return a.time < b.time
            }
            let finalData = generateFinalData(data: midData)
            writeFinalData(data: finalData)
        }
        
        csvWriter.stream.close()
        
        print("end time:\(Date().description)")
    }
    
    fileprivate func allFiles() -> [URL] {
        let fileManager = FileManager.default
        let documentsURL = URL(string: fileDic)!
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
            return fileURLs
        } catch let err {
            print("Error while enumerating files \(documentsURL.path): \(err.localizedDescription)")
        }
        return []
    }
    
    fileprivate func generateMedieData(url: String) -> [MedieFileCSVFormat] {
        var result = [MedieFileCSVFormat]()
        
        let lowerBound = 2200000 //250
        let uppderBound = 3000000 //300
        var currentCount = 0
        do {
            let stream = InputStream(fileAtPath: url)!
            let csv = try CSVReader(stream: stream)
            var skipfirstrow = false
            while let row = csv.next() {
                
                if row.count < 21 {
                    print("invilid row!!!")
                    continue
                }
                
                if !skipfirstrow {
                    skipfirstrow = true
                    continue
                }
                
                // time
                if row[0].isEmpty {
                    continue
                }
                
                // uuid
                if row[1].isEmpty {
                    continue
                }
                
                currentCount = currentCount + 1
                if currentCount < lowerBound {
                    continue
                }
                if currentCount > uppderBound {
                    break
                }
                
                // 訪問
//                if result.index(where: { (item) -> Bool in
//                    return item.uuid == row[5]
//                }) == nil {
//                    if row[2] == "New" {
//                        var newLine = MedieFileCSVFormat()
//                        newLine.uuid = row[5]
//                        newLine.time = row[7].adobeDate()
//                        newLine.action = .firstVisit
//                        result.append(newLine)
//                    }
//                    continue
//                }

                var newLine = MedieFileCSVFormat()
                newLine.uuid = row[1]
                newLine.time = row[0].adobeDate()
                
                // 求人一覧閲覧
                if Int(row[15])! > 0 {
                    newLine.action = .checkSearchList
                    newLine.uuid = row[1]
                    newLine.time = row[0].adobeDate()
                    newLine.from = .searchList
                    newLine.visitSegment = VisitSegment(rawValue: row[3]) ?? .Other
                    
                    //求人詳細閲覧
                } else if Int(row[16])! > 0 {
                    newLine.action = .checkDetail
                    newLine.uuid = row[1]
                    newLine.time = row[0].adobeDate()
                    newLine.rqmtId = row[14]
                    newLine.visitSegment = VisitSegment(rawValue: row[3]) ?? .Other
                    
                    // キープ
                } else if Int(row[17])! > 0 {
                    newLine.action = .keep
                    newLine.uuid = row[1]
                    newLine.time = row[0].adobeDate()
                    newLine.rqmtId = row[14]
                    newLine.visitSegment = VisitSegment(rawValue: row[3]) ?? .Other
                    
                    // 応募開始
                } else if Int(row[18])! > 0 {
                    newLine.action = .beginApplying
                    newLine.uuid = row[1]
                    newLine.time = row[0].adobeDate()
                    newLine.rqmtId = row[14]
                    newLine.visitSegment = VisitSegment(rawValue: row[3]) ?? .Other
                    
                    // 応募確認
                } else if Int(row[19])! > 0{
                    newLine.action = .comfirmApplying
                    newLine.uuid = row[1]
                    newLine.time = row[0].adobeDate()
                    newLine.rqmtId = row[14]
                    newLine.visitSegment = VisitSegment(rawValue: row[3]) ?? .Other
                    
                    // 応募完了
                } else if Int(row[20])! > 0{
                    newLine.action = .applied
                    newLine.uuid = row[1]
                    newLine.time = row[0].adobeDate()
                    newLine.rqmtId = row[14]
                    newLine.visitSegment = VisitSegment(rawValue: row[3]) ?? .Other
                    
                } else {
                    continue
                }
                
                result.append(newLine)
            }
        } catch let err as NSError {
            print(err)
        }
        
        return result
    }
    
//    fileprivate func writeDerivedData(data: [MedieFileCSVFormat]) {
//        for item in data {
//            csvWriter.beginNewRow()
//            try! csvWriter.write(field: item.uuid)
//            try! csvWriter.write(field: item.time.description)
//            try! csvWriter.write(field: "\(item.action.rawValue)")
//        }
//    }
    
    fileprivate func generateFinalData( data: [MedieFileCSVFormat]) -> [FinalFileCSVFormat] {
        var tmpdic = [String: [MedieFileCSVFormat]]()
        var result = [FinalFileCSVFormat]()
        
        for item in data {
            // check existing
            for existingItem in tmpdic {
                if item.time.timeIntervalSince(existingItem.value.last!.time) > 60 * 20 {
                    result.append(contentsOf: covertOneVisitMediaFileToFinalFile(mid: existingItem.value))
                    tmpdic.removeValue(forKey: existingItem.key)
                }
            }
            
            // check new
            if tmpdic[item.uuid] != nil {
                tmpdic[item.uuid]!.append(item)
            } else {
                tmpdic[item.uuid] = [item]
            }
        }
        
        // check existing
        for existingItem in tmpdic {
            result.append(contentsOf: covertOneVisitMediaFileToFinalFile(mid: existingItem.value))
        }
        
        return result
    }
    
    fileprivate func writeFinalData(data: [FinalFileCSVFormat]) {
        for item in data {
            csvWriter.beginNewRow()
            try! csvWriter.write(field: item.uuid)
            try! csvWriter.write(field: "\(item.time)")
            try! csvWriter.write(field: "\(item.action.rawValue)")
            try! csvWriter.write(field: item.label.rawValue)
            try! csvWriter.write(field: item.visitSegment.rawValue)
            try! csvWriter.write(field: "\(item.checkingRqmtIsNthOfAllCheckedRqmts)")
            try! csvWriter.write(field: "\(item.numberOfViewedOfCurrentCheckingRqmt)")
            try! csvWriter.write(field: "\(item.resourceOfCurrentCheckingRqmt.rawValue)")
        }
    }
    
    fileprivate enum Action : Int {
        case checkSearchList = 1
        case checkDetail = 2
        case keep = 3
        case checkKeepList = 4
        case beginApplying = 5
        case comfirmApplying = 6
        case applied = 7
        case other = 0
    }
    
    fileprivate enum RqmtFrom : Int {
        case none = 0
        case searchList = 1
        case keeplist = 2
    }
    
    fileprivate enum UserSegment: String {
        case applied, notApplied
    }
    
    fileprivate enum VisitSegment: String {
        case New="New"
        case Repeat="Repeat"
        case Other="Other"
    }
    
    fileprivate struct MedieFileCSVFormat {
        var uuid = ""
        var time = Date()
        var from = RqmtFrom.none
        var action = Action.other
        var rqmtId = ""
        var visitSegment = VisitSegment.Other
    }
    
    fileprivate struct FinalFileCSVFormat {
        var uuid = ""
        var time = 0
        var action = Action.other
        var label = UserSegment.notApplied
        var visitSegment = VisitSegment.Other
        
        var checkingRqmtIsNthOfAllCheckedRqmts = 0
        var numberOfViewedOfCurrentCheckingRqmt = 0
        
        var resourceOfCurrentCheckingRqmt = RqmtFrom.none
    }
    
    private func covertOneVisitMediaFileToFinalFile(mid: [MedieFileCSVFormat]) -> [FinalFileCSVFormat] {
        var result = [FinalFileCSVFormat]()
        var label = UserSegment.notApplied
        let firstItem = mid.first!
        var rqmtIdList = [String]()
        var rqmtIdCount = [String: Int]()
        
        for item in mid {
            if item.action == .applied {
                label = UserSegment.applied
                break
            }
        }
        
        for item in mid {
            var newItem = FinalFileCSVFormat()
            newItem.uuid = item.uuid
            newItem.time = Int(item.time.timeIntervalSince(firstItem.time))
            newItem.action = item.action
            newItem.label = label
            newItem.visitSegment = item.visitSegment
            if item.action == .checkDetail || item.action == .beginApplying || item.action == .comfirmApplying || item.action == .applied {
                if let checkedCount = rqmtIdCount[item.rqmtId] {
                    newItem.checkingRqmtIsNthOfAllCheckedRqmts = rqmtIdList.index(of: item.rqmtId)! + 1
                    newItem.numberOfViewedOfCurrentCheckingRqmt = checkedCount + 1
                    rqmtIdCount[item.rqmtId] = checkedCount + 1
                } else {
                    newItem.checkingRqmtIsNthOfAllCheckedRqmts = rqmtIdList.count + 1
                    newItem.numberOfViewedOfCurrentCheckingRqmt = 1
                    rqmtIdList.append(item.rqmtId)
                    rqmtIdCount[item.rqmtId] = 1
                }
            }
            result.append(newItem)
        }
        
        return result
    }
}

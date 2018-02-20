//
//  Report_ApplySegment.swift
//  Demo
//
//  Created by 田　甜 on 2018/02/15.
//  Copyright © 2018年 田　甜. All rights reserved.
//

import Foundation
import CSV

class Report_ApplySegment {
    private var reports = [ApplySegmentReportUnit]()
    private var count = 0
    func start() {
        reports = [ApplySegmentReportUnit]()
        let gendertypes = allGenderType()
        let ageRanges = allBirthRange()
        let jobtypes = allJobTypes()
        for a in gendertypes {
            for b in ageRanges {
                for c in jobtypes {
                    let aReport = ApplySegmentReportUnit(seg: UserSegment(gType: a, bRange: b, jType: c), re: TargetCount())
                    reports.append(aReport)
                }
            }
        }
        read()
        printResult()
    }
    
    fileprivate func read() {
        do {
            let stream = InputStream(fileAtPath: Resource_ApplySegmentReport)!
            let csv = try CSVReader(stream: stream)
            while let row = csv.next() {
                if row.count < 19 {
                    print("invilid row!!!")
                    continue
                }
                if row[12] != "WEB応募完了ページ表示" {
                    continue
                }
                if count > 100 {
                    return
                }
                var item = ApplySegmentRecord()
                item.time = row[0].adobeDate()
                item.uuid = row[1]
                item.mArea = row[2]
                item.sArea = row[3]
                item.lJobTypeCd = row[4]
                item.mJobTypeCd = row[5]
                item.alongRailCd = row[6]
                item.stationUnitCd = row[7]
                item.meritCd = row[8]
                item.hireType = row[9]
                item.salaryUnitCd = row[10]
                item.salaryRangeCd = row[11]
                item.page = row[12]
                item.applyGenderP = row[13]
                item.applyBirthP = row[14]
                item.applyJobP = row[15]
                item.applyGenderE = row[16]
                item.applyBirthE = row[17]
                item.applyJobE = row[18]
                check(item)
                count = count + 1
            }
        } catch let err as NSError {
            print(err)
        }
    }
    
    private func check(_ item: ApplySegmentRecord) {
        for report in reports {
            if report.segment.isKindOf(b: item) {
                report.results = update(target: report.results, with: item)
                return
            }
        }
        
        fatalError()
    }
    
    private func update(target: TargetCount, with item: ApplySegmentRecord) -> TargetCount {
        if let lJobCds = item.lJobTypeCd {
            let lJobs = Array(lJobCds.split(separator: " "))
            for aLJob in lJobs {
                let key = String(aLJob)
                if let value = target.lFindJobType[key] {
                    target.lFindJobType[key] = value + 1
                } else {
                    target.lFindJobType[key] = 1
                }
            }
        }
        if let mJobCds = item.mJobTypeCd {
            let mJobs = Array(mJobCds.split(separator: " "))
            for aLJob in mJobs {
                let key = String(aLJob)
                if let value = target.mFindJobType[key] {
                    target.mFindJobType[key] = value + 1
                } else {
                    target.mFindJobType[key] = 1
                }
            }
        }
        if let meritCds = item.meritCd {
            let merits = Array(meritCds.split(separator: " "))
            for mer in merits {
                let key = String(mer)
                if let value = target.merit[key] {
                    target.merit[key] = value + 1
                } else {
                    target.merit[key] = 1
                }
            }
        }
        if let hireType = item.hireType {
            let types = Array(hireType.split(separator: " "))
            for aType in types {
                let key = String(aType)
                if let value = target.hireType[key] {
                    target.hireType[key] = value + 1
                } else {
                    target.hireType[key] = 1
                }
            }
        }
        return target
    }
    
    private func printResult() {
        print("---------------report------------------")
        print("total count: \(count)")

        let stream = OutputStream(toFileAtPath: "/Users/01011776/Desktop/reports/report.csv", append: true)!
        let csv = try! CSVWriter(stream: stream)

        try! csv.write(row: ["seg_gender",
                             "seg_ageRange",
                             "seg_currentJobCd",
                             "seg_currentJobNm",
                             "report_category",
                             "report_cd",
                             "report_name",
                             "report_count"])
        
        for item in reports {
            let currentJobTypeNm = master_covertCurrentJobTypeCdToString(item.segment.currentJobType.rawValue)
            for unit in item.results.lFindJobType.enumerated() {
                csv.beginNewRow()
                try! csv.write(field: item.segment.genderType.rawValue)
                try! csv.write(field: item.segment.birthRange.rawValue)
                try! csv.write(field: item.segment.currentJobType.rawValue)
                try! csv.write(field: currentJobTypeNm)
                try! csv.write(field: "lFindJobType")
                try! csv.write(field: unit.element.key)
                try! csv.write(field: master_covertLJobTypeCdToString(unit.element.key))
                try! csv.write(field: "\(unit.element.value)")
            }

            for unit in item.results.mFindJobType.enumerated() {
                csv.beginNewRow()
                try! csv.write(field: item.segment.genderType.rawValue)
                try! csv.write(field: item.segment.birthRange.rawValue)
                try! csv.write(field: item.segment.currentJobType.rawValue)
                try! csv.write(field: currentJobTypeNm)
                try! csv.write(field: "mFindJobType")
                try! csv.write(field: unit.element.key)
                try! csv.write(field: master_covertMJobTypeCdToString(unit.element.key))
                try! csv.write(field: "\(unit.element.value)")
            }
            
            for unit in item.results.merit.enumerated() {
                csv.beginNewRow()
                try! csv.write(field: item.segment.genderType.rawValue)
                try! csv.write(field: item.segment.birthRange.rawValue)
                try! csv.write(field: item.segment.currentJobType.rawValue)
                try! csv.write(field: currentJobTypeNm)
                try! csv.write(field: "merit")
                try! csv.write(field: unit.element.key)
                try! csv.write(field: master_covertMeritCdToString(unit.element.key))
                try! csv.write(field: "\(unit.element.value)")
            }
            
            for unit in item.results.alongRailCd.enumerated() {
                csv.beginNewRow()
                try! csv.write(field: item.segment.genderType.rawValue)
                try! csv.write(field: item.segment.birthRange.rawValue)
                try! csv.write(field: item.segment.currentJobType.rawValue)
                try! csv.write(field: currentJobTypeNm)
                try! csv.write(field: "alongRailCd")
                try! csv.write(field: unit.element.key)
                try! csv.write(field: master_covertAlongRailCdToString(unit.element.key))
                try! csv.write(field: "\(unit.element.value)")
            }
            
            for unit in item.results.hireType.enumerated() {
                csv.beginNewRow()
                try! csv.write(field: item.segment.genderType.rawValue)
                try! csv.write(field: item.segment.birthRange.rawValue)
                try! csv.write(field: item.segment.currentJobType.rawValue)
                try! csv.write(field: currentJobTypeNm)
                try! csv.write(field: "hireType")
                try! csv.write(field: unit.element.key)
                try! csv.write(field: "")
                try! csv.write(field: "\(unit.element.value)")
            }
        }
        csv.stream.close()
    }
}

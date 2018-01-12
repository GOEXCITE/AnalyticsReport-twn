//
//  ReportUnit.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/19.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

struct ReportSearchResultListActivity {
    var dataType = DataType()
    var totalNum = 0
    var endWithKept = 0
    var endWithApplied = 0
}

class ReportConditionNumberAndConditionRankingOfSpecificType {
    var countType = CountType.NotAvaliable
    var conditionNumberObserver = [ConditionNumber: Int]()
    var areaUsedNumber = 0
    var jobTypeNumber = 0
    var railOrStationnumber = 0
    var meritNumber = 0
    var hireTypeNumber = 0
    var salaryNumber = 0
}

extension Util {
    static func generateReport_ObserveDetailResultCountAndAmbiguousConditionType() -> [ReportSearchResultListActivity] {
        var report = [ReportSearchResultListActivity]()
        
        for i in 0...2 {
            for j in CountType.startIndex()...CountType.endIndex() {
                if let conditionType = AmbiguousConditionType(rawValue: i),
                    let countType = CountType(rawValue: j){
                    var addNewUnit = ReportSearchResultListActivity()
                    addNewUnit.dataType.conditionType = conditionType
                    addNewUnit.dataType.countType = countType
                    report.append(addNewUnit)
                }
            }
        }        
        return report
    }
    
    static func generateReportConditionNumberAndConditionRankingOfSpecificType() -> [ReportConditionNumberAndConditionRankingOfSpecificType] {
        var report = [ReportConditionNumberAndConditionRankingOfSpecificType]()
        
        for i in 1...CountType.endIndex() {
            if let type = CountType(rawValue: i) {
                let newReport = ReportConditionNumberAndConditionRankingOfSpecificType()
                newReport.countType = type
                report.append(newReport)
            }
        }
        
        return report
    }
}

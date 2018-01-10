//
//  ReportUnit.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/19.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

struct ReportUnit {
    var dataType = DataType()
    var totalNum = 0
    var endWithKept = 0
    var endWithApplied = 0
}

extension Util {
    static func generateReport_ObserveDetailResultCountAndAmbiguousConditionType() -> [ReportUnit] {
        var report = [ReportUnit]()
        
        for i in 0...2 {
            for j in -1...12 {
                if let conditionType = AmbiguousConditionType(rawValue: i),
                    let countType = CountType(rawValue: j){
                    var addNewUnit = ReportUnit()
                    addNewUnit.dataType.conditionType = conditionType
                    addNewUnit.dataType.countType = countType
                    report.append(addNewUnit)
                }
            }
        }        
        return report
    }
}

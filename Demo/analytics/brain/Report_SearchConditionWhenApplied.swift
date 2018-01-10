//
//  Report_SearchConditionWhenApplied.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/19.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

class Report_SearchConditionWhenApplied {
    static let shared = Report_SearchConditionWhenApplied()
    private var data = [DataRecord]()
    
    init() {
        data = Util.read()
    }
    
    func observe() {
        print("start observing Report_SearchConditionWhenApplied!")
        
//        var observingUsers = [String: (DataType, ActionStep, Date)]()
        var totalAppliedNum = 0
        var areaConditionUsedNum = 0
        var jobTypeConditionUsedNum = 0
        var stationConditionUsedNum = 0
        var meritConditionUsedNum = 0
        var hireConditionUsedNum = 0
        var salaryConditionUsedNum = 0
        
        while !data.isEmpty {
            let item = data.first!
            
            guard let uuid = item.uuid, !uuid.isEmpty, item.version == "タウンワーク4.49.0" else {
                data.removeFirst()
                continue
            }
            
            if !Util.isAppliedAction(dataUnit: item) || Util.dataUnitAmbiguousConditionType(item) == .Empty {
                data.removeFirst()
                continue
            }
            
            totalAppliedNum = totalAppliedNum + 1
            if item.hasAreaCondition() {
                areaConditionUsedNum = areaConditionUsedNum + 1
            }
            if item.hasJobTypeCondition() {
                jobTypeConditionUsedNum = jobTypeConditionUsedNum + 1
            }
            if item.hasRailOrStationCondition() {
                stationConditionUsedNum = stationConditionUsedNum + 1
            }
            if item.hasMeritCondition() {
                meritConditionUsedNum = meritConditionUsedNum + 1
            }
            if item.hasHireTypeCondition() {
                hireConditionUsedNum = hireConditionUsedNum + 1
            }
            if item.hasSalaryCondition() {
                salaryConditionUsedNum = salaryConditionUsedNum + 1
            }
            data.removeFirst()
        }
        
        print("totalAppliedNum: \(totalAppliedNum)")
        print("areaConditionUsedNum: \(areaConditionUsedNum)")
        print("jobTypeConditionUsedNum: \(jobTypeConditionUsedNum)")
        print("stationConditionUsedNum: \(stationConditionUsedNum)")
        print("meritConditionUsedNum: \(meritConditionUsedNum)")
        print("hireConditionUsedNum: \(hireConditionUsedNum)")
        print("salaryConditionUsedNum: \(salaryConditionUsedNum)")
        print("observing finished!")
        //        Util.write(data: targetData, to: "twn_1204-1210_com.csv")
    }
}

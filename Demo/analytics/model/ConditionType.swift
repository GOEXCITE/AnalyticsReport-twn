//
//  ConditionType.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/19.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

enum AmbiguousConditionType: Int {
    case Empty = 0, NotFull = 1, Full = 2
}

enum DetailConditionType: Int {
    case OnlyArea = 0, OnlyJobType = 1, OnlyStation = 2, OnlyMerit = 3, OnlyHireType = 4, OnlySalary = 5, Others = 6
}

extension Util {    
    static func dataUnitAmbiguousConditionType(_ unit: DataRecord) -> AmbiguousConditionType {
        if unit.mArea!.isEmpty &&
            unit.sArea!.isEmpty &&
            unit.lJobTypeCd!.isEmpty &&
            unit.mJobTypeCd!.isEmpty &&
            unit.alongRailCd!.isEmpty &&
            unit.stationUnitCd!.isEmpty &&
            unit.meritCd!.isEmpty &&
            unit.hireType!.isEmpty &&
            unit.salaryUnitCd!.isEmpty &&
            unit.salaryRangeCd!.isEmpty {
            return .Empty
        }
        if (!unit.mArea!.isEmpty || !unit.sArea!.isEmpty) &&
            (!unit.lJobTypeCd!.isEmpty || !unit.mJobTypeCd!.isEmpty) &&
            (!unit.alongRailCd!.isEmpty || !unit.stationUnitCd!.isEmpty) &&
            !unit.meritCd!.isEmpty &&
            !unit.hireType!.isEmpty &&
            !unit.salaryUnitCd!.isEmpty &&
            !unit.salaryRangeCd!.isEmpty {
            return .Full
        }
        return .NotFull
    }
    
    static func dataUnitDetailConditionType(_ dataUnit: DataRecord) -> DetailConditionType {
        if dataUnitAmbiguousConditionType(dataUnit) == .Empty {
            return .Others
        }
        if dataUnit.noAreaCondition() &&
            dataUnit.noJobTypeCondition() &&
            dataUnit.noStationCondition() &&
            dataUnit.noMeritCondition() &&
            dataUnit.noHireTypeCondition() {
            return .OnlySalary
        }
        if dataUnit.noAreaCondition() &&
            dataUnit.noJobTypeCondition() &&
            dataUnit.noStationCondition() &&
            dataUnit.noMeritCondition() &&
            dataUnit.noSalaryCondition() {
            return .OnlyHireType
        }
        if dataUnit.noAreaCondition() &&
            dataUnit.noJobTypeCondition() &&
            dataUnit.noStationCondition() &&
            dataUnit.noSalaryCondition() &&
            dataUnit.noHireTypeCondition() {
            return .OnlyMerit
        }
        if dataUnit.noAreaCondition() &&
            dataUnit.noJobTypeCondition() &&
            dataUnit.noMeritCondition() &&
            dataUnit.noHireTypeCondition() &&
            dataUnit.noSalaryCondition() {
            return .OnlyStation
        }
        if dataUnit.noAreaCondition() &&
            dataUnit.noStationCondition() &&
            dataUnit.noMeritCondition() &&
            dataUnit.noHireTypeCondition() &&
            dataUnit.noSalaryCondition() {
            return .OnlyJobType
        }
        if dataUnit.noJobTypeCondition() &&
            dataUnit.noStationCondition() &&
            dataUnit.noMeritCondition() &&
            dataUnit.noHireTypeCondition() &&
            dataUnit.noSalaryCondition() {
            return .OnlyArea
        }
        print("ERROR: Should never be here!")
        return .Others
    }
    
}

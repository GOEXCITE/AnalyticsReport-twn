//
//  DataUnit.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/15.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

enum ConditionType {
    case Area, JobType, RailOrStation, Merit, HireType, Salary
}

class DataRecord {
    var version : String? // アプリ名&バージョン_e11 (evar11)
    var time : Date!
    var uuid : String?
    var mArea : String?
    var sArea : String?
    var lJobTypeCd : String?
    var mJobTypeCd : String?
    var alongRailCd : String?
    var stationUnitCd : String?
    var meritCd : String?
    var hireType : String?
    var salaryUnitCd : String?
    var salaryRangeCd : String?
    var searchResultCount : String? //evar48
    var eventPageName : String?
    var bannerId : String?
    var page: String?
    var addKeepAction : String?
    
    func noAreaCondition() -> Bool {
        return mArea!.isEmpty && sArea!.isEmpty
    }
    func noJobTypeCondition() -> Bool {
        return lJobTypeCd!.isEmpty && mJobTypeCd!.isEmpty
    }
    func noStationCondition() -> Bool {
        return alongRailCd!.isEmpty && stationUnitCd!.isEmpty
    }
    func noMeritCondition() -> Bool {
        return meritCd!.isEmpty
    }
    func noHireTypeCondition() -> Bool {
        return hireType!.isEmpty
    }
    func noSalaryCondition() -> Bool {
        return salaryUnitCd!.isEmpty && salaryRangeCd!.isEmpty
    }
    
    func hasCondition(_ conditionType: ConditionType) -> Bool {
        switch conditionType {
        case .Area:
            return hasAreaCondition()
        case .JobType:
            return hasJobTypeCondition()
        case .RailOrStation:
            return hasRailOrStationCondition()
        case .Merit:
            return hasMeritCondition()
        case .HireType:
            return hasHireTypeCondition()
        case .Salary:
            return hasSalaryCondition()
        }
    }
    func hasAreaCondition() -> Bool {
        return !mArea!.isEmpty || !sArea!.isEmpty
    }
    func hasJobTypeCondition() -> Bool {
        return !lJobTypeCd!.isEmpty || !mJobTypeCd!.isEmpty
    }
    func hasRailOrStationCondition() -> Bool {
        return !alongRailCd!.isEmpty || !stationUnitCd!.isEmpty
    }
    func hasMeritCondition() -> Bool {
        return !meritCd!.isEmpty
    }
    func hasHireTypeCondition() -> Bool {
        return !hireType!.isEmpty
    }
    func hasSalaryCondition() -> Bool {
        return !salaryUnitCd!.isEmpty || !salaryRangeCd!.isEmpty
    }
}

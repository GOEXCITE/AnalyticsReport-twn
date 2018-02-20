//
//  UserSegment.swift
//  Demo
//
//  Created by 田　甜 on 2018/02/20.
//  Copyright © 2018年 田　甜. All rights reserved.
//

import Foundation

struct UserSegment {
    let genderType: GenderType
    let birthRange: BirthRange
    let currentJobType: CurrentJobType
    init(gType: GenderType, bRange: BirthRange, jType: CurrentJobType) {
        genderType = gType
        birthRange = bRange
        currentJobType = jType
    }
    
    func isEquals(to b: UserSegment) -> Bool {
        return genderType == b.genderType && birthRange == b.birthRange && currentJobType == b.currentJobType
    }
    
    func isKindOf(b: ApplySegmentRecord) -> Bool {
        return genderType == covertStringToGenderType(b.applyGenderE!)
            && birthRange == covertStringToBirthRange(b.applyBirthE!)
            && currentJobType == covertStringToJobType(b.applyJobE!)
    }
}

class TargetCount {
    var lFindJobType = [String: Int]()
    var mFindJobType = [String: Int]()
    var merit = [String: Int]()
    var mArea = [String: Int]()
    var alongRailCd = [String: Int]()
//    var stationUnitCd = [String: Int]()
    var hireType = [String: Int]()
}

class ApplySegmentReportUnit {
    let segment: UserSegment
    var results: TargetCount
    init(seg: UserSegment, re: TargetCount) {
        segment = seg
        results = re
    }
}

// data part
struct ApplySegmentRecord {
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
    var page: String?
    var applyGenderP : String?
    var applyBirthP : String?
    var applyJobP : String?
    var applyGenderE : String?
    var applyBirthE : String?
    var applyJobE : String?
}

enum GenderType: String {
    case Man = "1"
    case Female = "2"
    case Unknow = "0"
}

func allGenderType() -> [GenderType] {
    return [.Man, .Female, .Unknow]
}

enum BirthRange: String{
    case Below18 = "18以下", Between18To22 = "18~22", Above22 = "22以上"
}

func allBirthRange() -> [BirthRange] {
    return [.Below18, .Between18To22, .Above22]
}

enum CurrentJobType : String {
    case HighSchool = "01"
    case University = "02"
    case Arubaito = "06"
    case Musyoku = "09"
    case Senmongakousei = "05"
    case Other = "10"
    case Syufu = "08"
    case Seisyain = "11"
    case Haken = "13"
    case Keiyaku = "12"
    case Tandai = "04"
    case Daigakuinsei = "03"
    case Unknow = "00"
}

func allJobTypes() -> [CurrentJobType] {
    return [.HighSchool, .University, .Arubaito, .Musyoku, .Senmongakousei, .Other, .Syufu, .Seisyain, .Haken, .Keiyaku, .Tandai, .Daigakuinsei, .Unknow]
}

func covertStringToGenderType(_ str: String) -> GenderType {
    if str == GenderType.Female.rawValue {
        return .Female
    }
    if str == GenderType.Man.rawValue {
        return .Man
    }
    return .Unknow
}

func covertStringToBirthRange(_ birthString: String) -> BirthRange {
    let value = Int(birthString)!
    if value > 200000 {
        return .Below18
    }
    if value < 199713 {
        return .Above22
    }
    return .Between18To22
}

func covertStringToJobType(_ str: String) -> CurrentJobType {
    if let r = CurrentJobType(rawValue: str) {
        return r
    }
    return .Unknow
}

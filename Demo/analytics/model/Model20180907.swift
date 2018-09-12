//
//  Model20180907.swift
//  Demo
//
//  Created by 田　甜 on 2018/09/07.
//  Copyright © 2018年 田　甜. All rights reserved.
//

import Foundation

struct Model20180907 {
    var time : Date!
    var uuid : String!
    var page: String?
    var visitNumber: String?
    
    var eventPage: String?
    
    var areaId: String?
    var todoufukenId: String?
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
    
    var gpsRange : String?
    
    var applyGender : String?
    var applyBirth : String?
    var applyJob : String?
    
    var keepEvent: String?
    var rqmtId: String?
}

struct Model20180907Output {
    var uuid: String = ""
    var visitNumber: String = ""
    var time: String = ""
    var content: String = ""
    var type: String = ""
}

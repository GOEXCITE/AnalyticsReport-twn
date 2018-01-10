//
//  DataType.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/19.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

struct DataType {
    var conditionType = AmbiguousConditionType.Empty
    var countType = CountType.NotAvaliable
    
    init() { }
    
    init(_ dataUnit: DataUnit) {
        conditionType = Util.dataUnitAmbiguousConditionType(dataUnit)
        countType = Util.dataUnitCountType(unit: dataUnit)
    }
    
    func isEqual(targetType: DataType) -> Bool {
        return conditionType == targetType.conditionType && countType == targetType.countType
    }
}



//
//  CountType.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/19.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

enum CountType : Int {
    case NotAvaliable = -1
    case Zero = 0
    case C1To100 = 1
    case C100To200 = 2
    case C200To300 = 3
    case C300To400 = 4
    case C400To500 = 5
    case C500To1000 = 6
    case C1000To5000 = 7
    case c5000To10000 = 8
    case c10000To20000 = 9
    case c20000To30000 = 10
    case c30000To40000 = 11
    case c40000above = 12
    
    static func preferentialCountType(beforeType: CountType, afterType: CountType) -> CountType {
        if afterType == .NotAvaliable {
            return beforeType
        }
        return afterType
    }
}

extension Util {
    static func dataUnitCountType(unit: DataUnit) -> CountType {
        guard let countSti = unit.searchResultCount, let count = Int(countSti) else {
            return .NotAvaliable
        }
        if count >= 40000 {
            return .c40000above
        }
        if count >= 30000 {
            return .c30000To40000
        }
        if count >= 20000 {
            return .c20000To30000
        }
        if count >= 10000 {
            return .c10000To20000
        }
        if count >= 5000 {
            return .c5000To10000
        }
        if count >= 1000 {
            return .C1000To5000
        }
        if count >= 500 {
            return .C500To1000
        }
        if count >= 400 {
            return .C400To500
        }
        if count >= 300 {
            return .C300To400
        }
        if count >= 200 {
            return .C200To300
        }
        if count >= 100 {
            return .C100To200
        }
        if count > 0 {
            return .C1To100
        }
        return .Zero
    }
}

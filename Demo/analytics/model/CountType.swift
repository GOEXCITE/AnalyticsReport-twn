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
    case C1To10 = 1
    case C10To50 = 2
    case C50To100 = 3
    case C100To200 = 4
    case C200To300 = 5
    case C300To400 = 6
    case C400To500 = 7
    case C500To600 = 8
    case C600To700 = 9
    case C700To800 = 10
    case C800To900 = 11
    case C900To1000 = 12
    case C1000To2000 = 13
    case C2000To3000 = 14
    case C3000To4000 = 15
    case C4000To5000 = 16
    case C5000To6000 = 17
    case C6000To7000 = 18
    case C7000To8000 = 19
    case C8000To9000 = 20
    case C9000To10000 = 21
    case C10000To20000 = 22
    case C20000To30000 = 23
    case c30000To40000 = 24
    case c40000above = 25
    
    static func startIndex() -> Int {
        return 0
    }
    
    static func endIndex() -> Int {
        return 25
    }
    
    static func preferentialCountType(beforeType: CountType, afterType: CountType) -> CountType {
        if afterType == .NotAvaliable {
            return beforeType
        }
        return afterType
    }
}

extension Util {
    static func dataUnitCountType(unit: DataRecord) -> CountType {
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
            return .C20000To30000
        }
        if count >= 10000 {
            return .C10000To20000
        }
        if count >= 9000 {
            return .C9000To10000
        }
        if count >= 8000 {
            return .C8000To9000
        }
        if count >= 7000 {
            return .C7000To8000
        }
        if count >= 6000 {
            return .C6000To7000
        }
        if count >= 5000 {
            return .C5000To6000
        }
        if count >= 4000 {
            return .C4000To5000
        }
        if count >= 3000 {
            return .C3000To4000
        }
        if count >= 2000 {
            return .C2000To3000
        }
        if count >= 1000 {
            return .C1000To2000
        }
        if count >= 900 {
            return .C900To1000
        }
        if count >= 800 {
            return .C800To900
        }
        if count >= 700 {
            return .C700To800
        }
        if count >= 600 {
            return .C600To700
        }
        if count >= 500 {
            return .C500To600
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
        if count >= 50 {
            return .C50To100
        }
        if count >= 10 {
            return .C10To50
        }
        if count > 0 {
            return .C1To10
        }
        return .Zero
    }
}

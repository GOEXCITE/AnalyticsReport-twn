//
//  CountType.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/19.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

enum CountType : Int {
    
    case NotAvaliable = 0   // Empty
//    case One = 1    // =0
//    case Four = 2   // >=500
//    case Three = 3  // >=100, <500
//    case Two = 4    // >0, <100
    case OneToOneHundred = 1
    case OneHundredToTwoHundred = 2
    case TwoHundredToThreeHundred = 3
    case ThreeHundredToFourHundred = 4
    case FourHundredToFiveHundred = 5
    case AboveFiveHundred = 6
    case Zero = 7
    
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
        if count >= 500 {
            return .AboveFiveHundred
        }
        if count >= 400 {
            return .FourHundredToFiveHundred
        }
        if count >= 300 {
            return .ThreeHundredToFourHundred
        }
        if count >= 200 {
            return .TwoHundredToThreeHundred
        }
        if count >= 100 {
            return .OneHundredToTwoHundred
        }
        if count > 0 {
            return .OneToOneHundred
        }
        return .Zero
    }
}

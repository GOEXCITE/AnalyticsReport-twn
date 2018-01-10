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
        
        var one = ReportUnit()
        one.dataType.conditionType = AmbiguousConditionType.Empty
        one.dataType.countType = CountType.OneToOneHundred
        report.append(one)
        
        var two = ReportUnit()
        two.dataType.conditionType = AmbiguousConditionType.Empty
        two.dataType.countType = CountType.OneHundredToTwoHundred
        report.append(two)
        
        var three = ReportUnit()
        three.dataType.conditionType = AmbiguousConditionType.Empty
        three.dataType.countType = CountType.TwoHundredToThreeHundred
        report.append(three)
        
        var four = ReportUnit()
        four.dataType.conditionType = AmbiguousConditionType.Empty
        four.dataType.countType = CountType.ThreeHundredToFourHundred
        report.append(four)
        
        var four1 = ReportUnit()
        four1.dataType.conditionType = AmbiguousConditionType.Empty
        four1.dataType.countType = CountType.FourHundredToFiveHundred
        report.append(four1)
        
        var four2 = ReportUnit()
        four2.dataType.conditionType = AmbiguousConditionType.Empty
        four2.dataType.countType = CountType.AboveFiveHundred
        report.append(four2)
        
        var five = ReportUnit()
        five.dataType.conditionType = AmbiguousConditionType.NotFull
        five.dataType.countType = CountType.OneToOneHundred
        report.append(five)
        
        var six = ReportUnit()
        six.dataType.conditionType = AmbiguousConditionType.NotFull
        six.dataType.countType = CountType.OneHundredToTwoHundred
        report.append(six)
        
        var seven = ReportUnit()
        seven.dataType.conditionType = AmbiguousConditionType.NotFull
        seven.dataType.countType = CountType.TwoHundredToThreeHundred
        report.append(seven)
        
        var eight = ReportUnit()
        eight.dataType.conditionType = AmbiguousConditionType.NotFull
        eight.dataType.countType = CountType.ThreeHundredToFourHundred
        report.append(eight)
        
        var eight1 = ReportUnit()
        eight1.dataType.conditionType = AmbiguousConditionType.NotFull
        eight1.dataType.countType = CountType.FourHundredToFiveHundred
        report.append(eight1)
        
        var eight2 = ReportUnit()
        eight2.dataType.conditionType = AmbiguousConditionType.NotFull
        eight2.dataType.countType = CountType.AboveFiveHundred
        report.append(eight2)
        
        var nine = ReportUnit()
        nine.dataType.conditionType = AmbiguousConditionType.Full
        nine.dataType.countType = CountType.OneToOneHundred
        report.append(nine)
        
        var ten = ReportUnit()
        ten.dataType.conditionType = AmbiguousConditionType.Full
        ten.dataType.countType = CountType.OneHundredToTwoHundred
        report.append(ten)
        
        var eleven = ReportUnit()
        eleven.dataType.conditionType = AmbiguousConditionType.Full
        eleven.dataType.countType = CountType.TwoHundredToThreeHundred
        report.append(eleven)
        
        var twelve = ReportUnit()
        twelve.dataType.conditionType = AmbiguousConditionType.Full
        twelve.dataType.countType = CountType.ThreeHundredToFourHundred
        report.append(twelve)
        
        var twelve1 = ReportUnit()
        twelve1.dataType.conditionType = AmbiguousConditionType.Full
        twelve1.dataType.countType = CountType.FourHundredToFiveHundred
        report.append(twelve1)
        
        var twelve2 = ReportUnit()
        twelve2.dataType.conditionType = AmbiguousConditionType.Full
        twelve2.dataType.countType = CountType.AboveFiveHundred
        report.append(twelve2)
        
        return report
    }
    
    static func generateReport_Report_SearchConditionWhenApplied() -> [ReportUnit] {
        var report = [ReportUnit]()
        
        var one = ReportUnit()
        one.dataType.conditionType = AmbiguousConditionType.Empty
        one.dataType.countType = CountType.OneToOneHundred
        report.append(one)
        
        var two = ReportUnit()
        two.dataType.conditionType = AmbiguousConditionType.Empty
        two.dataType.countType = CountType.OneHundredToTwoHundred
        report.append(two)
        
        var three = ReportUnit()
        three.dataType.conditionType = AmbiguousConditionType.Empty
        three.dataType.countType = CountType.TwoHundredToThreeHundred
        report.append(three)
        
        var four = ReportUnit()
        four.dataType.conditionType = AmbiguousConditionType.Empty
        four.dataType.countType = CountType.ThreeHundredToFourHundred
        report.append(four)
        
        var four1 = ReportUnit()
        four1.dataType.conditionType = AmbiguousConditionType.Empty
        four1.dataType.countType = CountType.FourHundredToFiveHundred
        report.append(four1)
        
        var four2 = ReportUnit()
        four2.dataType.conditionType = AmbiguousConditionType.Empty
        four2.dataType.countType = CountType.AboveFiveHundred
        report.append(four2)
        
        var five = ReportUnit()
        five.dataType.conditionType = AmbiguousConditionType.NotFull
        five.dataType.countType = CountType.OneToOneHundred
        report.append(five)
        
        var six = ReportUnit()
        six.dataType.conditionType = AmbiguousConditionType.NotFull
        six.dataType.countType = CountType.OneHundredToTwoHundred
        report.append(six)
        
        var seven = ReportUnit()
        seven.dataType.conditionType = AmbiguousConditionType.NotFull
        seven.dataType.countType = CountType.TwoHundredToThreeHundred
        report.append(seven)
        
        var eight = ReportUnit()
        eight.dataType.conditionType = AmbiguousConditionType.NotFull
        eight.dataType.countType = CountType.ThreeHundredToFourHundred
        report.append(eight)
        
        var eight1 = ReportUnit()
        eight1.dataType.conditionType = AmbiguousConditionType.NotFull
        eight1.dataType.countType = CountType.FourHundredToFiveHundred
        report.append(eight1)
        
        var eight2 = ReportUnit()
        eight2.dataType.conditionType = AmbiguousConditionType.NotFull
        eight2.dataType.countType = CountType.AboveFiveHundred
        report.append(eight2)
        
        var nine = ReportUnit()
        nine.dataType.conditionType = AmbiguousConditionType.Full
        nine.dataType.countType = CountType.OneToOneHundred
        report.append(nine)
        
        var ten = ReportUnit()
        ten.dataType.conditionType = AmbiguousConditionType.Full
        ten.dataType.countType = CountType.OneHundredToTwoHundred
        report.append(ten)
        
        var eleven = ReportUnit()
        eleven.dataType.conditionType = AmbiguousConditionType.Full
        eleven.dataType.countType = CountType.TwoHundredToThreeHundred
        report.append(eleven)
        
        var twelve = ReportUnit()
        twelve.dataType.conditionType = AmbiguousConditionType.Full
        twelve.dataType.countType = CountType.ThreeHundredToFourHundred
        report.append(twelve)
        
        var twelve1 = ReportUnit()
        twelve1.dataType.conditionType = AmbiguousConditionType.Full
        twelve1.dataType.countType = CountType.FourHundredToFiveHundred
        report.append(twelve1)
        
        var twelve2 = ReportUnit()
        twelve2.dataType.conditionType = AmbiguousConditionType.Full
        twelve2.dataType.countType = CountType.AboveFiveHundred
        report.append(twelve2)
        
        return report
    }
}

//
//  ActionStep.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/19.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

enum ActionStep {
    case CheckedSearchList, Kept, CheckedDetail, Applying, Applied, Others
}

extension Util {
    static func isAppliedAction(dataUnit: DataUnit) -> Bool {
        if let eventName = dataUnit.eventPageName, eventName == "求人情報詳細画面起動" {
            return true
        }
        return false
    }
    
    static func dataUnitActionStep(dataUnit: DataUnit) -> ActionStep {
        if let kept = dataUnit.addKeepAction, let keptState = Int(kept), keptState > 0 {
            return .Kept
        }
        if let eventName = dataUnit.eventPageName {
            if eventName == "求人情報一覧画面起動" {
                return .CheckedSearchList
            }
            if eventName == "求人情報詳細画面起動" {
                return .CheckedDetail
            }
            if eventName == "WEB応募完了ページ表示" {
                return .Applied
            }
            if eventName.contains("WEB応募") {
                return .Applying
            }
        }
        return .Others
    }
    
    static func isForwardAction(beforeAction: ActionStep, afterAction: ActionStep) -> Bool {
        switch beforeAction {
        case .Applied, .Others:
            return false
        case .Kept:
            return afterAction == .Applying || afterAction == .Applied || afterAction == .Kept
        case .CheckedSearchList:
            return true
        case .CheckedDetail:
            return afterAction != .Others
        case .Applying:
            return afterAction == .Applied || afterAction == .CheckedDetail
        }
    }
}

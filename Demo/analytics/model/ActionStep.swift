//
//  ActionStep.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/19.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

enum ActionStep {
    case OpenSearchListView, Kept, OpenDetailView, Applying, OpenAppliedView, Others, NotChanged
}

extension Util {
    static func isAppliedAction(dataUnit: DataRecord) -> Bool {
        if dataUnit.page! == "WEB応募完了ページ表示" {
            return true
        }
        return false
    }
    
    static func dataUnitActionStep(dataUnit: DataRecord) -> ActionStep {
        if let kept = dataUnit.addKeepAction, let keptState = Int(kept), keptState > 0 {
            return .Kept
        }
        if let pageView = dataUnit.page, !pageView.isEmpty {
            if pageView == "求人情報一覧画面起動" {
                return .OpenSearchListView
            }
            if pageView == "求人情報詳細画面起動" {
                return .OpenDetailView
            }
            if pageView == "WEB応募完了ページ表示" {
                return .OpenAppliedView
            }
            if pageView.contains("WEB応募") {
                return .Applying
            }
            return .Others
        }
        return .NotChanged
    }

    static func isForwardAction(beforeAction: ActionStep, afterAction: ActionStep) -> Bool {
        switch beforeAction {
        case .NotChanged:
            return afterAction != .Others
        case .OpenAppliedView, .Others:
            return false
        case .OpenSearchListView, .Kept, .OpenDetailView, .Applying:
            return afterAction != .Others
        }
    }
}

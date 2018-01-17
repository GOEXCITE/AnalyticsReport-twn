//
//  ActionStep.swift
//  Demo
//
//  Created by 田　甜 on 2017/12/19.
//  Copyright © 2017年 田　甜. All rights reserved.
//

import Foundation

enum ActionStep {
    case Kept, Applied, None
}

enum WatchPage {
    case SearchList
    case Applied
    case MakeDifferentDirectionFromSearchList
    case SameDirectionWithPreviousDirection
}

extension Util {
    static func isAppliedAction(dataUnit: DataRecord) -> Bool {
        if dataUnit.page! == "WEB応募完了ページ表示" {
            return true
        }
        return false
    }
    
    static func dataRecordWatchingPage(_ currentDataRecord: DataRecord) -> WatchPage {
        if currentDataRecord.page! == "求人情報一覧画面起動" {
            return .SearchList
        }

        if currentDataRecord.page! == "WEB応募完了ページ表示" {
            return .Applied
        }

        if !currentDataRecord.page!.isEmpty {
            let diffOriginFromSearchListStrings = ["閲覧履歴画面起動", "キープリスト画面起動"]
            
            for item in diffOriginFromSearchListStrings {
                if currentDataRecord.page! == item {
                    return .MakeDifferentDirectionFromSearchList
                }
            }
        }
        return .SameDirectionWithPreviousDirection
    }
    
    static func dataRecordAction(_ dataUnit: DataRecord) -> ActionStep {
        if let kept = dataUnit.addKeepAction, let keptState = Int(kept), keptState > 0 {
            return .Kept
        }
        return .None
//        if let pageView = dataUnit.page, !pageView.isEmpty {
//            if pageView == "求人情報一覧画面起動" {
//                return .OpenSearchListView
//            }
//            if pageView == "求人情報詳細画面起動" {
//                if dataUnit.eventPageName!.contains("キープリスト") || dataUnit.eventPageName!.contains("閲覧履歴") {
//                    return .OpenDetailViewFromOthers
//                } else {
//                    return .OpenDetailViewFromSearchList
//                }
//            }
//            if pageView == "WEB応募完了ページ表示" {
//                return .OpenAppliedView
//            }
//            if pageView.contains("WEB応募") || pageView == "web掲載中修正アラート画面起動" {
//                return .Applying
//            }
//            if pageView == "応募済掲載中修正アラート画面起動" || pageView == "Tel発信ダイアログ画面起動" || pageView == "Tel掲載中修正アラート画面起動" || pageView == "写真画面起動" || pageView == "地図詳細画面起動" {
//                return .CheckingDetail
//            }
//        }
//        return .NotChanged
    }
}

//
//  ConditionInflow.swift
//  Demo
//
//  Created by 田　甜 on 2018/01/16.
//  Copyright © 2018年 田　甜. All rights reserved.
//

import Foundation

class ConditionInflow {
    enum Case: Int {
        case Koukouseiouen = 1, Koutuhishikyu = 2, Tanki = 3, Openingu = 4, Hibarai = 5, Higeakuse = 6, Syubarai = 7, Hanbai = 8, Syunisankai = 9, Suitupankafe = 10, ZenbaraiOk = 11,
        DaigakuseiKangei = 12, InsyokuFood = 13, Kamigatajiyu = 14, Keisagyou = 15, RejiKonbini = 16, Kourusenta = 17, MikeikennOk = 18, TanpatuOk = 19, Makanai = 20, ShifutoSoudan = 21,
        IconKonbini = 22, IconKosumeOrDoragusudoa = 23, IconIzakaya = 24, IconHouru = 25, IconKafe = 26, IconFamiresu = 27, IconApareru = 28, IconZaka = 29, IconIbento = 30,
        Mitukaru1 = 31, Mitukaru2 = 32, Mitukaru3 = 33, Mitukaru4 = 34, Mitukaru5 = 35, Mitukaru6 = 36, Mitukaru7 = 37
    }
    
    static func conditionInflowType(_ unit: DataRecord) -> ConditionInflow.Case? {
        if isKouKouSeiOuen(unit) {
            return .Koukouseiouen
        }
        if isKoutuhishikyu(unit) {
            return .Koutuhishikyu
        }
        if isTanki(unit) {
            return .Tanki
        }
        if isOpeningu(unit) {
            return .Openingu
        }
        if isHibarai(unit) {
            return .Hibarai
        }
        if isHigeakuse(unit) {
            return .Higeakuse
        }
        if isSyubarai(unit) {
            return .Syubarai
        }
        if isHanbai(unit) {
            return .Hanbai
        }
        if isSyunisankai(unit) {
            return .Syunisankai
        }
        if isSuitupankafe(unit) {
            return .Suitupankafe
        }
        if isZenbaraiOk(unit) {
            return .ZenbaraiOk
        }
        if isDaigakuseiKangei(unit) {
            return .DaigakuseiKangei
        }
        if isInsyokuFood(unit) {
            return .InsyokuFood
        }
        if isKamigatajiyu(unit) {
            return .Kamigatajiyu
        }
        if isKeisagyou(unit) {
            return .Keisagyou
        }
        if isRejikonbini(unit) {
            return .RejiKonbini
        }
        if isKourusenta(unit) {
            return .Kourusenta
        }
        if isMikeikennOk(unit) {
            return .MikeikennOk
        }
        if isTanpatuOk(unit) {
            return .TanpatuOk
        }
        if isMakanai(unit) {
            return .Makanai
        }
        if isShifutoSoudan(unit) {
            return .ShifutoSoudan
        }
        if isIconKonbini(unit) {
            return .IconKonbini
        }
        if isIconCosumeOrDoragusudoa(unit) {
            return .IconKosumeOrDoragusudoa
        }
        return nil
    }
    
    // 高校生応援prfCd = 0025  -> prop49 = topA_0025 No.2
    static func isKouKouSeiOuen(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0025" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // 交通費支給 = 0027
    static func isKoutuhishikyu(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0027" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // 短期 = 0052 -> prop49 = topA_0052 No.1
    static func isTanki(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0052" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // オープニングスタッフ = 3029 -> prop49 = topA_3029
    static func isOpeningu(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "3029" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // 日払い = 0054 -> prop49 = topA_0054
    static func isHibarai(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0054" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // 髭・ネイル・ピアスOK = 0081
    static func isHigeakuse(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0081" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // 週払い = 0055
    static func isSyubarai(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0055" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // 販売
    static func isHanbai(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "00201 00202 00203 00204 00206 00207 00208 00209 00210 00211 00213 00214 00215 00217 00218 00219 00220 00221 00222 00223 00224 00225" {
//            if unit.lJobTypeCd! != "002" {
//                print("not possible!")
//            }
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // 週2、3日からOK = 0064
    static func isSyunisankai(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0064" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // スイーツ・パン・カフェ
    // カフェ・喫茶店: 00115
    // パン屋（ベーカリー）：00117
    // ケーキ屋・スイーツ: 00118
    static func isSuitupankafe(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "00115 00117 00118" {
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // 給与前払いOK = 0056
    static func isZenbaraiOk(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0056" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // 大学生歓迎 = 0004
    static func isDaigakuseiKangei(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0004" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // 飲食・フード
    static func isInsyokuFood(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "00101 00102 00105 00106 00108 00109 00110 00111 00112 00113 00114 00115 00117 00118 00119 00120 00121 00122 00123 00124 00125 00126 00127 00128 00129 00130" {
//            if unit.lJobTypeCd! != "001" {
//                print("warning!!!")
//            }
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // 髪型・髪色自由 = 3010
    static func isKamigatajiyu(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "3010" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // 軽作業 prop49 = topA_018
    static func isKeisagyou(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "01202 01203 01213 01218" {
//            if unit.lJobTypeCd! != "018" {
//                print("warning!!")
//            }
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // レジ・コンビニ
    static func isRejikonbini(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "00206 00208" {
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // コールセンター・テレオペ: 00310
    static func isKourusenta(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "00310" {
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // 未経験・初心者OK = 0024
    static func isMikeikennOk(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0024" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // 単発・1日OK = 0051
    static func isTanpatuOk(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0051" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // まかない・食事補助あり = 0026
    static func isMakanai(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0026" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // 時間や曜日が選べる・シフト自由 = 0019
    static func isShifutoSoudan(_ unit: DataRecord) -> Bool {
        guard let meritCd = unit.meritCd else {
            return false
        }
        return meritCd == "0019" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noJobTypeCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // アイコン：コンビニ 00208 -> prop49 = topB_00215_1 or topB_00215_2
    static func isIconKonbini(_ unit: DataRecord) -> Bool {
        guard let mJobTypeCd = unit.mJobTypeCd else {
            return false
        }
        return mJobTypeCd == "00208" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noMeritCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // アイコン：コスメ or ドラッグストア・薬局・化粧品販売 00215
    static func isIconCosumeOrDoragusudoa(_ unit: DataRecord) -> Bool {
        guard let mJobTypeCd = unit.mJobTypeCd else {
            return false
        }
        return mJobTypeCd == "00215" && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noMeritCondition() && unit.noStationCondition() && unit.hireType! == "01"
    }
    
    // --------------------
    // アイコン：居酒屋
    static func isIconIzakaya(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "00109 00112" {
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // アイコン：ホール
    static func isIconHouru(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "00112 00113 00114" {
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // アイコン：カフェ
    static func isIconKafe(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "00115" {
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // アイコン：ファミレス
    static func isIconFamiresu(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "00110 00113" {
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // アイコン：アパレル
    static func isIconApareru(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "00202" {
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // アイコン：雑貨
    static func isIconZaka(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "00214" {
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
    
    // アイコン：イベント
    static func isIconIbento(_ unit: DataRecord) -> Bool {
        if unit.mJobTypeCd! == "01102" {
            return unit.noMeritCondition() && unit.noAreaCondition() && unit.noSalaryCondition() && unit.noStationCondition() && unit.hireType! == "01"
        }
        return false
    }
}

// 見つかる：高校生応援・飲食フードのバイト
// 見つかる：まかないあり・居酒屋のバイト
// 見つかる：かわいいバイト・パン屋ケーキ屋

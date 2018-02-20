//
//  Master.swift
//  Demo
//
//  Created by 田　甜 on 2018/02/20.
//  Copyright © 2018年 田　甜. All rights reserved.
//

import Foundation

func master_covertCurrentJobTypeCdToString(_ str: String) -> String {
    if str == "01" { return "高校生"}
    if str == "02" { return "大学生"}
    if str == "06" { return "アルバイト・パート"}
    if str == "09" { return "無職"}
    if str == "05" { return "専門学校生"}
    if str == "10" { return "その他"}
    if str == "08" { return "主婦・主夫"}
    if str == "11" { return "正社員"}
    if str == "13" { return "派遣社員"}
    if str == "12" { return "契約社員"}
    if str == "04" { return "短大生"}
    if str == "03" { return "大学院生"}
    return ""
}
func master_covertLJobTypeCdToString(_ str: String) -> String {
    if str == "001" { return "飲食/フード"}
    if str == "002" { return "販売"}
    if str == "010" { return "接客/サービス"}
    if str == "011" { return "レジャー/エンタメ"}
    if str == "009" { return "営業"}
    if str == "003" { return "事務"}
    if str == "004" { return "総務/企画"}
    if str == "014" { return "教育"}
    if str == "012" { return "物流/配送"}
    if str == "018" { return "軽作業"}
    if str == "013" { return "建築/土木/建設"}
    if str == "019" { return "工場/製造"}
    if str == "005" { return "IT/コンピュータ"}
    if str == "015" { return "医療/介護/福祉"}
    if str == "007" { return "マスコミ/出版"}
    if str == "008" { return "芸能"}
    if str == "017" { return "専門職/その他"}
    return ""
}

func master_covertMJobTypeCdToString(_ str: String) -> String {
    if str == "00101" { return "飲食店(店長・マネージャー)"}
    if str == "00102" { return "宅配・デリバリー"}
    if str == "00105" { return "食品製造・販売"}
    if str == "00106" { return "ファーストフード"}
    if str == "00108" { return "その他飲食/フード"}
    if str == "00109" { return "キッチンスタッフ(居酒屋)"}
    if str == "00110" { return "キッチンスタッフ(ファミレス・レストラン)"}
    if str == "00111" { return "キッチンスタッフ(その他飲食店)"}
    if str == "00112" { return "居酒屋（ホールスタッフ)"}
    if str == "00113" { return "ファミレス・レストラン(ホールスタッフ)"}
    if str == "00114" { return "その他飲食店(ホールスタッフ)"}
    if str == "00115" { return "カフェ・喫茶店"}
    if str == "00117" { return "パン屋（ベーカリー）"}
    if str == "00118" { return "ケーキ屋・スイーツ"}
    if str == "00119" { return "焼肉屋"}
    if str == "00120" { return "うどん・蕎麦屋"}
    if str == "00121" { return "寿司屋・回転寿司"}
    if str == "00122" { return "ラーメン屋"}
    if str == "00123" { return "ビアガーデン"}
    if str == "00124" { return "弁当屋"}
    if str == "00125" { return "惣菜・デリ・デパ地下"}
    if str == "00126" { return "ピザ屋"}
    if str == "00127" { return "フードコート"}
    if str == "00128" { return "バー（BAR）・バーテンダー"}
    if str == "00129" { return "皿洗い・洗い場"}
    if str == "00130" { return "配膳"}
    if str == "00201" { return "ファッションデザイナー・パタンナー"}
    if str == "00202" { return "アパレル"}
    if str == "00203" { return "バイヤー"}
    if str == "00204" { return "販売店(店長・マネージャー)"}
    if str == "00206" { return "レジ"}
    if str == "00207" { return "試食試飲・デモンストレーター・マネキン"}
    if str == "00208" { return "コンビニ"}
    if str == "00209" { return "DPE･カメラ店スタッフ"}
    if str == "00210" { return "レンタルビデオ・CD"}
    if str == "00211" { return "スタイリスト"}
    if str == "00213" { return "家電量販店・携帯販売（携帯ショップ）"}
    if str == "00214" { return "インテリア・雑貨販売"}
    if str == "00215" { return "ドラッグストア・薬局・化粧品販売"}
    if str == "00217" { return "その他販売"}
    if str == "00218" { return "書店・本屋"}
    if str == "00219" { return "CD・DVD販売"}
    if str == "00220" { return "ペットショップ"}
    if str == "00221" { return "スーパー"}
    if str == "00222" { return "花屋（フラワーショップ）"}
    if str == "00223" { return "100円ショップ"}
    if str == "00224" { return "ホームセンター"}
    if str == "00225" { return "グッズ販売"}
    if str == "00302" { return "電話応対"}
    if str == "00303" { return "一般事務"}
    if str == "00304" { return "経理事務"}
    if str == "00305" { return "営業事務"}
    if str == "00306" { return "貿易事務"}
    if str == "00307" { return "伝票整理・資料作成"}
    if str == "00308" { return "事務関連派遣職"}
    if str == "00309" { return "その他事務"}
    if str == "00310" { return "コールセンター・テレオペ"}
    if str == "00311" { return "秘書"}
    if str == "00312" { return "受付（レセプション）"}
    if str == "00313" { return "学校事務"}
    if str == "00401" { return "企画"}
    if str == "00402" { return "広報・宣伝・販売促進・マーケティング"}
    if str == "00403" { return "派遣コーディネーター"}
    if str == "00404" { return "その他総務・企画"}
    if str == "00501" { return "ＳＥ（システムエンジニア）"}
    if str == "00502" { return "プログラマー"}
    if str == "00503" { return "データ入力・PC入力"}
    if str == "00504" { return "ユーザーサポート"}
    if str == "00505" { return "OA・パソコンインストラクター"}
    if str == "00506" { return "IT系派遣職"}
    if str == "00507" { return "その他コンピュータ関連職"}
    if str == "00508" { return "ゲームテスター・デバッガー"}
    if str == "00701" { return "印刷・製本"}
    if str == "00703" { return "カメラマン（男女）"}
    if str == "00704" { return "その他マスコミ/出版"}
    if str == "00705" { return "広告"}
    if str == "00706" { return "校正"}
    if str == "00707" { return "ビデオ・ラジオ・テレビ局"}
    if str == "00801" { return "モデル・俳優・エキストラ"}
    if str == "00802" { return "キャンペーンスタッフ・キャンペーンガール"}
    if str == "00803" { return "イベントコンパニオン"}
    if str == "00804" { return "その他芸能"}
    if str == "00903" { return "テレフォンアポインター（テレアポ）"}
    if str == "00904" { return "営業アシスタント"}
    if str == "00905" { return "ルートセールス"}
    if str == "00906" { return "新聞社"}
    if str == "00907" { return "営業関連派遣職"}
    if str == "00908" { return "その他営業"}
    if str == "00911" { return "営業・企画営業（法人対象）"}
    if str == "00912" { return "営業・企画営業（個人対象）"}
    if str == "01001" { return "ガソリンスタンド"}
    if str == "01002" { return "サービス業(店長・マネージャー)"}
    if str == "01004" { return "清掃員・掃除"}
    if str == "01005" { return "クリーニング・洗浄"}
    if str == "01006" { return "ビルメンテナンス（ビル管理・設備管理他）"}
    if str == "01007" { return "警備員・監視員"}
    if str == "01008" { return "ベビーシッター"}
    if str == "01009" { return "ポスティング・チラシ配り"}
    if str == "01010" { return "パーキングスタッフ"}
    if str == "01011" { return "冠婚葬祭関連（ブライダル・結婚式場他）"}
    if str == "01012" { return "サービス関連派遣職"}
    if str == "01013" { return "その他サービス"}
    if str == "01014" { return "サンプリング・ティッシュ配り"}
    if str == "01015" { return "家事代行"}
    if str == "01016" { return "洗車"}
    if str == "01101" { return "レジャー施設(店長・マネージャー)"}
    if str == "01102" { return "イベントスタッフ・コンサートスタッフ"}
    if str == "01103" { return "カラオケ"}
    if str == "01104" { return "パチンコ"}
    if str == "01105" { return "アミューズメントスタッフ"}
    if str == "01107" { return "ホテルスタッフ（フロント等）"}
    if str == "01109" { return "その他宿泊施設業務"}
    if str == "01110" { return "フロント・受付"}
    if str == "01111" { return "インストラクター"}
    if str == "01113" { return "ゴルフ場（キャディ）"}
    if str == "01114" { return "その他レジャー"}
    if str == "01115" { return "ペンション・旅館・民宿スタッフ"}
    if str == "01116" { return "漫画喫茶・ネットカフェ"}
    if str == "01117" { return "映画館"}
    if str == "01118" { return "スキー場"}
    if str == "01119" { return "ベッドメイキング"}
    if str == "01120" { return "レンタカー"}
    if str == "01121" { return "温泉・銭湯・スーパー銭湯"}
    if str == "01122" { return "プール監視員"}
    if str == "01201" { return "牛乳配達・新聞配達"}
    if str == "01202" { return "在庫管理・商品管理"}
    if str == "01203" { return "倉庫・検品"}
    if str == "01206" { return "セールスドライバー"}
    if str == "01208" { return "バイク便"}
    if str == "01210" { return "ドライバー助手"}
    if str == "01211" { return "ドライバー・運転手"}
    if str == "01212" { return "大型ドライバー（トラック・バス・牽引）"}
    if str == "01213" { return "仕分け"}
    if str == "01214" { return "その他物流/配送"}
    if str == "01215" { return "配達・配送"}
    if str == "01216" { return "引越し"}
    if str == "01217" { return "フォークリフト"}
    if str == "01218" { return "品出し・ピッキング"}
    if str == "01301" { return "測量技士"}
    if str == "01302" { return "ＣＡＤオペレーター"}
    if str == "01303" { return "建築・設計関連技術者"}
    if str == "01304" { return "電気・機械設計関連技術者"}
    if str == "01305" { return "土木工事関連"}
    if str == "01306" { return "躯体工事関連"}
    if str == "01307" { return "仕上工事関連"}
    if str == "01308" { return "設備工事関連"}
    if str == "01309" { return "製造業"}
    if str == "01310" { return "金属・非鉄金属関連製造"}
    if str == "01311" { return "機械・電気関連製造"}
    if str == "01312" { return "自動車・輸送用機械製造"}
    if str == "01313" { return "生産管理"}
    if str == "01314" { return "建築・土木現場監督"}
    if str == "01315" { return "組立・加工"}
    if str == "01316" { return "設備施工管理・現場監督"}
    if str == "01401" { return "塾講師"}
    if str == "01402" { return "家庭教師"}
    if str == "01403" { return "保育士・幼稚園教諭"}
    if str == "01404" { return "その他教育・人材関連"}
    if str == "01406" { return "試験監督"}
    if str == "01501" { return "医療事務"}
    if str == "01502" { return "看護師（看護士）・准看護師"}
    if str == "01503" { return "薬剤師"}
    if str == "01504" { return "歯科衛生士・歯科技工士"}
    if str == "01505" { return "歯科助手"}
    if str == "01506" { return "ホームヘルパー（訪問介護等）"}
    if str == "01507" { return "マッサージ・セラピスト"}
    if str == "01508" { return "栄養士・管理栄養士"}
    if str == "01509" { return "医療技術者関連"}
    if str == "01510" { return "ケアマネージャー"}
    if str == "01511" { return "介護福祉士"}
    if str == "01512" { return "その他介護スタッフ"}
    if str == "01513" { return "その他医療"}
    if str == "01514" { return "看護助手"}
    if str == "01515" { return "理学療法士・作業療法士・言語聴覚士"}
    if str == "01516" { return "保健師"}
    if str == "01517" { return "生活相談員"}
    if str == "01518" { return "介護助手"}
    if str == "01520" { return "保育補助"}
    if str == "01701" { return "美容師"}
    if str == "01702" { return "理容師"}
    if str == "01703" { return "美容(エステ・ネイル)"}
    if str == "01704" { return "ヘアメイク・メイクアップ"}
    if str == "01705" { return "農業・林業・漁業"}
    if str == "01706" { return "研究開発技術者"}
    if str == "01707" { return "市場調査"}
    if str == "01708" { return "通訳・翻訳"}
    if str == "01709" { return "自動車整備士"}
    if str == "01710" { return "メカニック・整備士"}
    if str == "01711" { return "フランチャイズ"}
    if str == "01712" { return "トリマー"}
    if str == "01713" { return "その他派遣職"}
    if str == "01714" { return "その他専門職"}
    if str == "01716" { return "デザイナー・イラストレーター"}
    if str == "01717" { return "編集・記者・ライター"}
    if str == "01718" { return "ＤＴＰオペレーター"}
    if str == "01719" { return "インテリアコーディネーター"}
    if str == "01720" { return "クリエイター"}
    if str == "01721" { return "店長・マネージャー(パブ・クラブ)"}
    if str == "01722" { return "店長・マネージャー候補（パブ・クラブ）"}
    if str == "01723" { return "フロアレディ"}
    if str == "01724" { return "カウンターレディ"}
    if str == "01725" { return "ママ・チーママ"}
    if str == "01726" { return "バニーガール"}
    if str == "01727" { return "ホールスタッフ（パブ・クラブ）"}
    if str == "01731" { return "その他美容関連"}
    if str == "01732" { return "グラフィックデザイナー"}
    if str == "01733" { return "WEBデザイナー"}
    if str == "01734" { return "アンケート・モニター"}
    if str == "01735" { return "造園・庭師"}
    return ""
}

func master_covertMeritCdToString(_ str: String) -> String {
    if str == "0003" { return "高収入・高額"}
    if str == "0004" { return "大学生歓迎"}
    if str == "0005" { return "主婦・主夫歓迎"}
    if str == "0009" { return "英語が活かせる"}
    if str == "0010" { return "副業・WワークOK"}
    if str == "0012" { return "経験者・有資格者歓迎"}
    if str == "0013" { return "資格取得支援制度"}
    if str == "0014" { return "学歴不問"}
    if str == "0015" { return "寮・社宅・住宅手当あり"}
    if str == "0016" { return "早朝・朝の仕事"}
    if str == "0017" { return "昼からの仕事"}
    if str == "0018" { return "夕方からの仕事"}
    if str == "0019" { return "時間や曜日が選べる・シフト自由"}
    if str == "0020" { return "平日のみOK"}
    if str == "0021" { return "土日祝のみOK"}
    if str == "0023" { return "長期歓迎"}
    if str == "0024" { return "未経験・初心者OK"}
    if str == "0025" { return "高校生応援"}
    if str == "0026" { return "まかない・食事補助あり"}
    if str == "0027" { return "交通費支給"}
    if str == "0029" { return "シニア応援"}
    if str == "0051" { return "単発・1日OK"}
    if str == "0052" { return "短期"}
    if str == "0053" { return "春・夏・冬休み期間限定"}
    if str == "0054" { return "日払い"}
    if str == "0055" { return "週払い"}
    if str == "0056" { return "給与前払いOK"}
    if str == "0057" { return "扶養内勤務OK"}
    if str == "0058" { return "ミドル活躍中"}
    if str == "0059" { return "留学生歓迎"}
    if str == "0060" { return "フリーター歓迎"}
    if str == "0061" { return "ブランクOK"}
    if str == "0062" { return "シフト制"}
    if str == "0063" { return "週1日からOK"}
    if str == "0064" { return "週2、3日からOK"}
    if str == "0065" { return "週4日以上OK"}
    if str == "0066" { return "夜からの仕事"}
    if str == "0067" { return "深夜・夜勤の仕事"}
    if str == "0068" { return "短時間勤務(1日4h以内)"}
    if str == "0069" { return "フルタイム歓迎"}
    if str == "0070" { return "時間固定シフト制"}
    if str == "0071" { return "ボーナス・賞与あり"}
    if str == "0072" { return "社員登用あり"}
    if str == "0073" { return "社割あり"}
    if str == "0074" { return "送迎あり"}
    if str == "0075" { return "産休・育休制度実績あり"}
    if str == "0076" { return "長期休暇あり"}
    if str == "0077" { return "車通勤OK"}
    if str == "0078" { return "バイク通勤OK"}
    if str == "0079" { return "リゾート"}
    if str == "0080" { return "在宅"}
    if str == "0081" { return "髭・ネイル・ピアスOK"}
    if str == "0082" { return "制服あり"}
    if str == "0083" { return "託児所あり"}
    if str == "0084" { return "駅チカ・駅ナカ"}
    if str == "0085" { return "残業なし"}
    if str == "0086" { return "研修あり"}
    if str == "0087" { return "履歴書不要"}
    if str == "0088" { return "入社祝い金支給"}
    if str == "0089" { return "友達と応募OK"}
    if str == "0090" { return "即日勤務OK"}
    if str == "0091" { return "無期雇用派遣"}
    if str == "3010" { return "髪型・髪色自由"}
    if str == "3011" { return "服装自由"}
    if str == "3029" { return "オープニングスタッフ"}
    return ""
}

func master_covertMAreaCdToString(_ str: String) -> String {
    if str == "04106" { return "23区以外"}
    if str == "04101" { return "23区"}
    if str == "04201" { return "横浜市"}
    if str == "04204" { return "川崎市"}
    if str == "04202" { return "相模原市"}
    if str == "04203" { return "神奈川県その他"}
    if str == "04303" { return "千葉市"}
    if str == "04301" { return "千葉県その他"}
    if str == "04401" { return "さいたま市"}
    if str == "04402" { return "埼玉県その他"}
    if str == "04500" { return "群馬県"}
    if str == "04600" { return "栃木県"}
    if str == "04700" { return "茨城県"}
    if str == "06101" { return "大阪市"}
    if str == "06103" { return "堺市"}
    if str == "06104" { return "大阪府その他"}
    if str == "06201" { return "神戸市"}
    if str == "06203" { return "兵庫県その他"}
    if str == "06301" { return "京都市"}
    if str == "06303" { return "京都府その他"}
    if str == "06400" { return "滋賀県"}
    if str == "06500" { return "奈良県"}
    if str == "06600" { return "和歌山県"}
    if str == "08100" { return "名古屋市"}
    if str == "08101" { return "愛知県その他"}
    if str == "08400" { return "三重県"}
    if str == "08500" { return "岐阜県"}
    if str == "60000" { return "静岡市"}
    if str == "60001" { return "浜松市"}
    if str == "60002" { return "静岡県その他"}
    if str == "10100" { return "札幌市"}
    if str == "10101" { return "北海道その他"}
    if str == "10600" { return "仙台市"}
    if str == "10601" { return "宮城県その他"}
    if str == "10700" { return "福島県"}
    if str == "10800" { return "山形県"}
    if str == "10900" { return "岩手県"}
    if str == "11000" { return "秋田県"}
    if str == "11100" { return "青森県"}
    if str == "12200" { return "富山県"}
    if str == "12300" { return "石川県"}
    if str == "12400" { return "福井県"}
    if str == "13100" { return "広島市"}
    if str == "13101" { return "広島県その他"}
    if str == "13200" { return "岡山市"}
    if str == "13201" { return "岡山県その他"}
    if str == "13300" { return "鳥取県"}
    if str == "13400" { return "島根県"}
    if str == "13500" { return "山口県"}
    if str == "13600" { return "香川県"}
    if str == "13700" { return "愛媛県"}
    if str == "13800" { return "徳島県"}
    if str == "13900" { return "高知県"}
    if str == "44002" { return "北九州市"}
    if str == "44001" { return "福岡市"}
    if str == "44003" { return "福岡県その他"}
    if str == "44100" { return "佐賀県"}
    if str == "44200" { return "長崎県"}
    if str == "44300" { return "熊本市"}
    if str == "44301" { return "熊本県その他"}
    if str == "44400" { return "大分県"}
    if str == "44500" { return "宮崎県"}
    if str == "44600" { return "鹿児島県"}
    if str == "44700" { return "沖縄県"}
    if str == "11600" { return "長野県"}
    if str == "11700" { return "新潟市"}
    if str == "11701" { return "新潟県その他"}
    if str == "11800" { return "山梨県"}
    return ""
}

func master_covertAlongRailCdToString(_ str: String) -> String {
    if str == "000000" { return "ＪＲ吉都線"}
    if str == "000001" { return "ＪＲ久大本線"}
    if str == "000002" { return "ＪＲ宮崎空港線"}
    if str == "000003" { return "ＪＲ後藤寺線"}
    if str == "000005" { return "ＪＲ香椎線"}
    if str == "000006" { return "ＪＲ佐世保線"}
    if str == "000007" { return "ＪＲ三角線"}
    if str == "000009" { return "ＪＲ指宿枕崎線"}
    if str == "000010" { return "ＪＲ鹿児島本線"}
    if str == "000013" { return "ＪＲ篠栗線"}
    if str == "000014" { return "ＪＲ大村線"}
    if str == "000016" { return "ＪＲ筑肥線"}
    if str == "000018" { return "ＪＲ筑豊本線（福北ゆたか線）"}
    if str == "000019" { return "ＪＲ長崎本線"}
    if str == "000021" { return "ＪＲ唐津線"}
    if str == "000022" { return "ＪＲ日田彦山線"}
    if str == "000023" { return "ＪＲ日南線"}
    if str == "000025" { return "ＪＲ日豊本線"}
    if str == "000026" { return "ＪＲ肥薩線"}
    if str == "000027" { return "ＪＲ豊肥本線"}
    if str == "000028" { return "ＪＲ高徳線"}
    if str == "000029" { return "ＪＲ土讃線"}
    if str == "000030" { return "ＪＲ徳島線"}
    if str == "000031" { return "ＪＲ内子線"}
    if str == "000032" { return "ＪＲ牟岐線"}
    if str == "000033" { return "ＪＲ鳴門線"}
    if str == "000035" { return "ＪＲ予讃線"}
    if str == "000038" { return "ＪＲ予土線"}
    if str == "000040" { return "ＪＲ因美線"}
    if str == "000041" { return "ＪＲ宇部線"}
    if str == "000042" { return "ＪＲ宇野線"}
    if str == "000043" { return "ＪＲ越美北線"}
    if str == "000045" { return "ＪＲ可部線"}
    if str == "000050" { return "ＪＲ岩徳線"}
    if str == "000053" { return "ＪＲ吉備線"}
    if str == "000055" { return "ＪＲ境線"}
    if str == "000056" { return "ＪＲ芸備線"}
    if str == "000058" { return "ＪＲ呉線"}
    if str == "000064" { return "ＪＲ三江線"}
    if str == "000068" { return "ＪＲ山口線"}
    if str == "000073" { return "ＪＲ七尾線"}
    if str == "000075" { return "ＪＲ小野田線"}
    if str == "000077" { return "ＪＲ城端線"}
    if str == "000078" { return "ＪＲ瀬戸大橋線"}
    if str == "000084" { return "ＪＲ津山線"}
    if str == "000088" { return "ＪＲ伯備線"}
    if str == "000089" { return "ＪＲ博多南線"}
    if str == "000090" { return "ＪＲ美祢線"}
    if str == "000092" { return "ＪＲ氷見線"}
    if str == "000093" { return "富山ライトレール"}
    if str == "000095" { return "ＪＲ福塩線"}
    if str == "000100" { return "ＪＲ木次線"}
    if str == "000119" { return "ＪＲ羽越本線"}
    if str == "000120" { return "ＪＲ越後線"}
    if str == "000122" { return "ＪＲ奥羽本線"}
    if str == "000125" { return "ＪＲ花輪線"}
    if str == "000127" { return "ＪＲ釜石線"}
    if str == "000129" { return "ＪＲ気仙沼線"}
    if str == "000134" { return "ＪＲ五能線"}
    if str == "000138" { return "ＪＲ左沢線"}
    if str == "000142" { return "ＪＲ山田線"}
    if str == "000145" { return "ＪＲ篠ノ井線"}
    if str == "000147" { return "ＪＲ小海線"}
    if str == "000153" { return "ＪＲ信越本線"}
    if str == "000163" { return "ＪＲ石巻線"}
    if str == "000164" { return "ＪＲ仙山線"}
    if str == "000165" { return "ＪＲ仙石線"}
    if str == "000170" { return "ＪＲ大糸線"}
    if str == "000171" { return "ＪＲ大船渡線"}
    if str == "000172" { return "ＪＲ大湊線"}
    if str == "000173" { return "ＪＲ只見線"}
    if str == "000174" { return "ＪＲ男鹿線"}
    if str == "000178" { return "ＪＲ津軽線"}
    if str == "000182" { return "ＪＲ田沢湖線"}
    if str == "000194" { return "ＪＲ白新線"}
    if str == "000195" { return "ＪＲ八戸線"}
    if str == "000198" { return "ＪＲ飯山線"}
    if str == "000199" { return "ＪＲ磐越西線"}
    if str == "000200" { return "ＪＲ磐越東線"}
    if str == "000203" { return "ＪＲ米坂線"}
    if str == "000204" { return "ＪＲ北上線"}
    if str == "000205" { return "ＪＲ弥彦線"}
    if str == "000206" { return "ＪＲ陸羽西線"}
    if str == "000207" { return "ＪＲ陸羽東線"}
    if str == "000209" { return "ＪＲ津軽海峡線"}
    if str == "000210" { return "ＪＲ釧網本線"}
    if str == "000214" { return "ＪＲ根室本線"}
    if str == "000215" { return "ＪＲ札沼線"}
    if str == "000217" { return "ＪＲ室蘭本線"}
    if str == "000219" { return "ＪＲ宗谷本線"}
    if str == "000220" { return "ＪＲ石勝線"}
    if str == "000222" { return "ＪＲ石北本線"}
    if str == "000223" { return "ＪＲ千歳線"}
    if str == "000225" { return "ＪＲ日高本線"}
    if str == "000230" { return "ＪＲ函館本線"}
    if str == "000231" { return "ＪＲ富良野線"}
    if str == "000232" { return "ＪＲ留萌本線"}
    if str == "000234" { return "くま川鉄道"}
    if str == "000236" { return "しなの鉄道"}
    if str == "000237" { return "のと鉄道七尾線"}
    if str == "000241" { return "阿佐海岸鉄道"}
    if str == "000242" { return "阿武隈急行"}
    if str == "000248" { return "伊予鉄道３系統"}
    if str == "000249" { return "伊予鉄道６系統"}
    if str == "000250" { return "伊予鉄道１・２系統"}
    if str == "000251" { return "伊予鉄道横河原線"}
    if str == "000252" { return "伊予鉄道郡中線"}
    if str == "000253" { return "伊予鉄道高浜線"}
    if str == "000254" { return "井原鉄道井原線"}
    if str == "000255" { return "一畑電車大社線"}
    if str == "000256" { return "一畑電車北松江線"}
    if str == "000263" { return "岡山電軌清輝橋線"}
    if str == "000264" { return "岡山電軌東山本線"}
    if str == "000266" { return "万葉線（旧加越能）"}
    if str == "000267" { return "会津鉄道会津線"}
    if str == "000269" { return "甘木鉄道"}
    if str == "000304" { return "錦川清流線"}
    if str == "000334" { return "熊本市電Ａ系統"}
    if str == "000335" { return "熊本市電Ｂ系統"}
    if str == "000336" { return "熊本電気鉄道菊池線"}
    if str == "000337" { return "熊本電気鉄道藤崎線"}
    if str == "000338" { return "広島高速交通アストラムライン"}
    if str == "000341" { return "広島電鉄宇品線"}
    if str == "000342" { return "広島電鉄皆実線"}
    if str == "000343" { return "広島電鉄本線"}
    if str == "000344" { return "広島電鉄白島線"}
    if str == "000345" { return "広島電鉄宮島線"}
    if str == "000346" { return "弘南鉄道弘南線"}
    if str == "000347" { return "弘南鉄道大鰐線"}
    if str == "000644" { return "高松琴平電気鉄道琴平線"}
    if str == "000645" { return "高松琴平電気鉄道志度線"}
    if str == "000646" { return "高松琴平電気鉄道長尾線"}
    if str == "000648" { return "黒部峡谷鉄道"}
    if str == "000665" { return "札幌市営東西線"}
    if str == "000666" { return "札幌市営東豊線"}
    if str == "000667" { return "札幌市営南北線"}
    if str == "000668" { return "札幌市電山鼻線"}
    if str == "000671" { return "三陸鉄道南リアス線"}
    if str == "000672" { return "三陸鉄道北リアス線"}
    if str == "000673" { return "山形鉄道フラワー長井線"}
    if str == "000677" { return "鹿児島市電１系統"}
    if str == "000678" { return "鹿児島市電２系統"}
    if str == "000681" { return "若桜鉄道"}
    if str == "000682" { return "秋田内陸縦貫鉄道"}
    if str == "000690" { return "松浦鉄道西九州線"}
    if str == "000691" { return "松本電気鉄道上高地線"}
    if str == "000694" { return "上田電鉄別所線"}
    if str == "000711" { return "水島臨海鉄道水島本線"}
    if str == "000712" { return "西鉄甘木線"}
    if str == "000713" { return "西鉄貝塚線"}
    if str == "000714" { return "西鉄太宰府線"}
    if str == "000715" { return "西鉄天神大牟田線"}
    if str == "000731" { return "仙台市営南北線"}
    if str == "000754" { return "筑豊電気鉄道"}
    if str == "000758" { return "長崎電軌桜町支線"}
    if str == "000760" { return "長崎電軌本線"}
    if str == "000763" { return "長野電鉄長野線"}
    if str == "000765" { return "津軽鉄道"}
    if str == "000778" { return "土佐くろしお鉄道"}
    if str == "000780" { return "とさでん交通桟橋線"}
    if str == "000781" { return "島原鉄道"}
    if str == "000813" { return "南阿蘇鉄道"}
    if str == "000826" { return "函館市電２系統"}
    if str == "000827" { return "函館市電５系統"}
    if str == "000829" { return "富山地方鉄道市内線"}
    if str == "000830" { return "富山地方鉄道不二越上滝線"}
    if str == "000831" { return "富山地方鉄道本線"}
    if str == "000832" { return "富山地方鉄道立山線"}
    if str == "000833" { return "富士急行"}
    if str == "000835" { return "福井鉄道福武線"}
    if str == "000836" { return "福岡市営空港線"}
    if str == "000837" { return "福岡市営箱崎線"}
    if str == "000838" { return "福島交通飯坂線"}
    if str == "000839" { return "平成筑豊鉄道伊田線"}
    if str == "000840" { return "平成筑豊鉄道糸田線"}
    if str == "000841" { return "平成筑豊鉄道田川線"}
    if str == "000845" { return "北越急行ほくほく線"}
    if str == "000849" { return "北九州モノレール"}
    if str == "000854" { return "北陸鉄道石川線"}
    if str == "000855" { return "北陸鉄道浅野川線"}
    if str == "000890" { return "由利高原鉄道鳥海山ろく線"}
    if str == "000901" { return "南海高野山ケーブル線"}
    if str == "000910" { return "ＪＲ湘南新宿ライン"}
    if str == "000913" { return "ＪＲ大阪環状連絡線"}
    if str == "000914" { return "伊予鉄道５系統"}
    if str == "000930" { return "近鉄生駒ケーブル"}
    if str == "000932" { return "土佐くろしお鉄道ごめん・なはり線"}
    if str == "000988" { return "ＩＧＲいわて銀河鉄道線"}
    if str == "000990" { return "青い森鉄道線"}
    if str == "001010" { return "えちぜん鉄道三国芦原線"}
    if str == "001011" { return "えちぜん鉄道勝山永平寺線"}
    if str == "001012" { return "ゆいレール"}
    if str == "001018" { return "肥薩おれんじ鉄道線"}
    if str == "001056" { return "福岡市営七隈線"}
    if str == "001086" { return "仙台空港線"}
    if str == "001096" { return "門司港レトロ観光線"}
    if str == "001162" { return "富山地方鉄道環状線"}
    if str == "001178" { return "スカイレールサービス"}
    if str == "001179" { return "近鉄西信貴ケーブル"}
    if str == "001183" { return "箱根登山鉄道ケーブル"}
    if str == "001199" { return "箱根ロープウェイ"}
    if str == "001230" { return "ＩＲいしかわ鉄道線"}
    if str == "001231" { return "あいの風とやま鉄道線"}
    if str == "001232" { return "日本海ひすいライン"}
    if str == "001233" { return "妙高はねうまライン"}
    if str == "001234" { return "しなの鉄道北しなの線"}
    if str == "001238" { return "京都丹後鉄道宮舞線"}
    if str == "001241" { return "仙台市営東西線"}
    if str == "001244" { return "道南いさりび鉄道線"}
    if str == "003391" { return "広島電鉄横川線"}
    if str == "003392" { return "広島電鉄江波線"}
    if str == "007571" { return "長崎電軌蛍茶屋支線"}
    if str == "007572" { return "長崎電軌大浦支線"}
    if str == "007791" { return "とさでん交通後免線"}
    if str == "007792" { return "とさでん交通伊野線"}
    if str == "110141" { return "ＪＲ山手線"}
    if str == "110176" { return "ＪＲ中央本線"}
    if str == "110239" { return "ゆりかもめ"}
    if str == "110766" { return "東京メトロ丸ノ内線"}
    if str == "110768" { return "東京メトロ銀座線"}
    if str == "110769" { return "東京メトロ千代田線"}
    if str == "110771" { return "東京メトロ東西線"}
    if str == "110772" { return "東京メトロ南北線"}
    if str == "110773" { return "東京メトロ日比谷線"}
    if str == "110774" { return "東京メトロ半蔵門線"}
    if str == "110775" { return "東京メトロ有楽町線"}
    if str == "110776" { return "東京メトロ副都心線"}
    if str == "110783" { return "東京モノレール"}
    if str == "110792" { return "都営大江戸線"}
    if str == "110793" { return "都営三田線"}
    if str == "110794" { return "都営新宿線"}
    if str == "110795" { return "都営浅草線"}
    if str == "110796" { return "都電荒川線"}
    if str == "110797" { return "りんかい線"}
    if str == "111092" { return "都営日暮里・舎人ライナー"}
    if str == "120104" { return "ＪＲ御殿場線"}
    if str == "120123" { return "ＪＲ横須賀線"}
    if str == "120124" { return "ＪＲ横浜線"}
    if str == "120131" { return "ＪＲ京浜東北線"}
    if str == "120137" { return "ＪＲ根岸線"}
    if str == "120167" { return "ＪＲ相模線"}
    if str == "120179" { return "ＪＲ鶴見線"}
    if str == "120192" { return "ＪＲ南武線"}
    if str == "120247" { return "伊豆箱根鉄道大雄山線"}
    if str == "120261" { return "横浜市営ブルーライン"}
    if str == "120262" { return "金沢シーサイドライン"}
    if str == "120294" { return "京急久里浜線"}
    if str == "120295" { return "京急空港線"}
    if str == "120296" { return "京急逗子線"}
    if str == "120297" { return "京急大師線"}
    if str == "120298" { return "京急本線"}
    if str == "120348" { return "江ノ島電鉄"}
    if str == "120685" { return "小田急江ノ島線"}
    if str == "120688" { return "小田急多摩線"}
    if str == "120692" { return "湘南モノレール"}
    if str == "120735" { return "相鉄いずみ野線"}
    if str == "120736" { return "相鉄本線"}
    if str == "120784" { return "東急こどもの国線"}
    if str == "120786" { return "東急世田谷線"}
    if str == "120787" { return "東急大井町線"}
    if str == "120788" { return "東急池上線"}
    if str == "120789" { return "東急田園都市線"}
    if str == "120790" { return "東急東横線"}
    if str == "120791" { return "東急目黒線"}
    if str == "120828" { return "箱根登山鉄道"}
    if str == "120903" { return "東急多摩川線"}
    if str == "121016" { return "横浜高速鉄道みなとみらい線"}
    if str == "121093" { return "横浜市営グリーンライン"}
    if str == "130133" { return "ＪＲ五日市線"}
    if str == "130162" { return "ＪＲ青梅線"}
    if str == "130197" { return "ＪＲ八高線"}
    if str == "130202" { return "ＪＲ武蔵野線"}
    if str == "130273" { return "京王井の頭線"}
    if str == "130274" { return "京王線"}
    if str == "130275" { return "京王競馬場線"}
    if str == "130276" { return "京王高尾線"}
    if str == "130277" { return "京王新線"}
    if str == "130278" { return "京王相模原線"}
    if str == "130279" { return "京王動物園線"}
    if str == "130686" { return "小田急小田原線"}
    if str == "130717" { return "西武園線"}
    if str == "130719" { return "西武国分寺線"}
    if str == "130721" { return "西武新宿線"}
    if str == "130722" { return "西武多摩湖線"}
    if str == "130724" { return "西武多摩川線"}
    if str == "130725" { return "西武池袋線"}
    if str == "130727" { return "西武拝島線"}
    if str == "130728" { return "西武豊島線"}
    if str == "130729" { return "西武有楽町線"}
    if str == "130738" { return "多摩都市モノレール線"}
    if str == "140136" { return "ＪＲ高崎線"}
    if str == "140139" { return "ＪＲ埼京線"}
    if str == "140166" { return "ＪＲ川越線"}
    if str == "140188" { return "ＪＲ東北本線"}
    if str == "140664" { return "埼玉新都市交通"}
    if str == "140718" { return "西武狭山線"}
    if str == "140720" { return "西武山口線"}
    if str == "140726" { return "西武秩父線"}
    if str == "140755" { return "秩父鉄道"}
    if str == "140798" { return "東武伊勢崎線"}
    if str == "140800" { return "東武越生線"}
    if str == "140802" { return "東武亀戸線"}
    if str == "140807" { return "東武大師線"}
    if str == "140808" { return "東武東上線"}
    if str == "140809" { return "東武日光線"}
    if str == "140810" { return "東武野田線"}
    if str == "140907" { return "埼玉高速鉄道線"}
    if str == "150126" { return "ＪＲ外房線"}
    if str == "150130" { return "ＪＲ久留里線"}
    if str == "150132" { return "ＪＲ京葉線"}
    if str == "150143" { return "ＪＲ鹿島線"}
    if str == "150151" { return "ＪＲ常磐線"}
    if str == "150159" { return "ＪＲ成田線"}
    if str == "150168" { return "ＪＲ総武本線"}
    if str == "150169" { return "ＪＲ総武線各停"}
    if str == "150184" { return "ＪＲ東金線"}
    if str == "150190" { return "ＪＲ内房線"}
    if str == "150233" { return "いすみ鉄道"}
    if str == "150286" { return "京成押上線"}
    if str == "150287" { return "京成金町線"}
    if str == "150288" { return "京成千原線"}
    if str == "150289" { return "京成千葉線"}
    if str == "150291" { return "京成本線"}
    if str == "150674" { return "山万ユーカリが丘線"}
    if str == "150689" { return "小湊鉄道"}
    if str == "150697" { return "新京成電鉄"}
    if str == "150732" { return "千葉都市モノレール１号線"}
    if str == "150733" { return "千葉都市モノレール２号線"}
    if str == "150737" { return "流鉄流山線"}
    if str == "150756" { return "銚子電気鉄道"}
    if str == "150811" { return "東葉高速線"}
    if str == "150852" { return "京成成田空港線・北総鉄道線"}
    if str == "150989" { return "芝山鉄道"}
    if str == "151066" { return "つくばエクスプレス"}
    if str == "210039" { return "ＪＲ東西線"}
    if str == "210063" { return "ＪＲ桜島線"}
    if str == "210082" { return "ＪＲ大阪環状線"}
    if str == "210325" { return "近鉄難波線"}
    if str == "210661" { return "阪神なんば線"}
    if str == "210744" { return "大阪市営御堂筋線"}
    if str == "210745" { return "大阪市営堺筋線"}
    if str == "210746" { return "大阪市営四つ橋線"}
    if str == "210747" { return "大阪市営千日前線"}
    if str == "210748" { return "大阪市営谷町線"}
    if str == "210749" { return "大阪市営中央線"}
    if str == "210750" { return "大阪市営長堀鶴見緑地線"}
    if str == "210751" { return "大阪市営南港ポートタウン線"}
    if str == "211085" { return "大阪市営今里筋線"}
    if str == "211094" { return "京阪中之島線"}
    if str == "220044" { return "ＪＲ加古川線"}
    if str == "220071" { return "ＪＲ山陽本線"}
    if str == "220080" { return "ＪＲ赤穂線"}
    if str == "220087" { return "ＪＲ播但線"}
    if str == "220091" { return "ＪＲ姫新線"}
    if str == "220096" { return "ＪＲ福知山線"}
    if str == "220650" { return "阪急伊丹線"}
    if str == "220652" { return "阪急甲陽線"}
    if str == "220653" { return "阪急今津線"}
    if str == "220654" { return "阪急神戸本線"}
    if str == "220662" { return "阪神武庫川線"}
    if str == "220663" { return "阪神本線"}
    if str == "220675" { return "山陽電鉄本線"}
    if str == "220676" { return "山陽電鉄網干線"}
    if str == "220701" { return "神戸高速鉄道東西線"}
    if str == "220702" { return "神戸高速鉄道南北線"}
    if str == "220703" { return "神戸市営西神・山手線"}
    if str == "220704" { return "神戸新交通ポートアイランド線"}
    if str == "220705" { return "神戸新交通六甲アイランド線"}
    if str == "220706" { return "神戸電鉄粟生線"}
    if str == "220707" { return "神戸電鉄公園都市線"}
    if str == "220708" { return "神戸電鉄三田線"}
    if str == "220709" { return "神戸電鉄有馬線"}
    if str == "220753" { return "智頭急行"}
    if str == "220850" { return "北条鉄道"}
    if str == "220851" { return "北神急行電鉄"}
    if str == "220908" { return "神戸市営海岸線"}
    if str == "230655" { return "阪急千里線"}
    if str == "230656" { return "阪急宝塚本線"}
    if str == "230657" { return "阪急箕面線"}
    if str == "230742" { return "大阪モノレール"}
    if str == "230743" { return "大阪モノレール彩都線"}
    if str == "230824" { return "能勢電鉄日生線"}
    if str == "230825" { return "能勢電鉄妙見線"}
    if str == "230853" { return "北大阪急行電鉄"}
    if str == "240057" { return "ＪＲ湖西線"}
    if str == "240066" { return "ＪＲ山陰本線"}
    if str == "240074" { return "ＪＲ小浜線"}
    if str == "240081" { return "ＪＲ草津線"}
    if str == "240086" { return "ＪＲ奈良線"}
    if str == "240094" { return "ＪＲ舞鶴線"}
    if str == "240097" { return "ＪＲ学研都市線"}
    if str == "240099" { return "ＪＲ北陸本線"}
    if str == "240258" { return "叡山電鉄鞍馬線"}
    if str == "240259" { return "叡山電鉄本線"}
    if str == "240280" { return "京阪宇治線"}
    if str == "240281" { return "京阪鴨東線"}
    if str == "240282" { return "京阪京津線"}
    if str == "240283" { return "京阪交野線"}
    if str == "240284" { return "京阪石山坂本線"}
    if str == "240285" { return "京阪本線"}
    if str == "240292" { return "京都市営烏丸線"}
    if str == "240293" { return "京都市営東西線"}
    if str == "240299" { return "京福北野線"}
    if str == "240300" { return "京福嵐山本線"}
    if str == "240308" { return "近鉄京都線"}
    if str == "240331" { return "近江鉄道多賀線"}
    if str == "240332" { return "近江鉄道八日市線"}
    if str == "240333" { return "近江鉄道本線"}
    if str == "240649" { return "嵯峨野観光鉄道"}
    if str == "240651" { return "阪急京都本線"}
    if str == "240658" { return "阪急嵐山線"}
    if str == "240696" { return "信楽高原鉄道"}
    if str == "240847" { return "京都丹後鉄道宮福線"}
    if str == "240848" { return "京都丹後鉄道宮豊線"}
    if str == "250062" { return "ＪＲ桜井線"}
    if str == "250306" { return "近鉄橿原線"}
    if str == "250307" { return "近鉄吉野線"}
    if str == "250309" { return "近鉄御所線"}
    if str == "250312" { return "近鉄信貴線"}
    if str == "250313" { return "近鉄生駒線"}
    if str == "250314" { return "近鉄大阪線"}
    if str == "250317" { return "近鉄天理線"}
    if str == "250318" { return "近鉄田原本線"}
    if str == "250319" { return "近鉄けいはんな線"}
    if str == "250322" { return "近鉄奈良線"}
    if str == "250324" { return "近鉄南大阪線"}
    if str == "251090" { return "ＪＲおおさか東線"}
    if str == "260047" { return "ＪＲ関西空港線"}
    if str == "260060" { return "ＪＲ阪和線"}
    if str == "260101" { return "ＪＲ和歌山線"}
    if str == "260272" { return "紀州鉄道"}
    if str == "260315" { return "近鉄長野線"}
    if str == "260321" { return "近鉄道明寺線"}
    if str == "260659" { return "阪堺電気軌道阪堺線"}
    if str == "260660" { return "阪堺電気軌道上町線"}
    if str == "260710" { return "水間鉄道"}
    if str == "260734" { return "泉北高速鉄道"}
    if str == "260814" { return "南海加太線"}
    if str == "260815" { return "わかやま電鉄貴志川線"}
    if str == "260816" { return "南海空港線"}
    if str == "260817" { return "南海高師浜線"}
    if str == "260818" { return "南海高野線"}
    if str == "260819" { return "南海汐見橋線"}
    if str == "260820" { return "南海多奈川線"}
    if str == "260821" { return "南海本線"}
    if str == "260822" { return "南海和歌山港線"}
    if str == "310856" { return "名古屋市営桜通線"}
    if str == "310857" { return "名古屋市営鶴舞線"}
    if str == "310858" { return "名古屋市営東山線"}
    if str == "310859" { return "名古屋市営名城線"}
    if str == "310860" { return "名古屋市営名港線"}
    if str == "320112" { return "ＪＲ東海道本線"}
    if str == "320329" { return "養老鉄道"}
    if str == "320752" { return "樽見鉄道"}
    if str == "320782" { return "東海交通事業城北線"}
    if str == "320861" { return "名鉄羽島線"}
    if str == "320876" { return "名鉄竹鼻線"}
    if str == "320877" { return "名鉄津島線"}
    if str == "320880" { return "名鉄尾西線"}
    if str == "320885" { return "名鉄名古屋本線"}
    if str == "330105" { return "ＪＲ高山本線"}
    if str == "330108" { return "ＪＲ太多線"}
    if str == "330243" { return "愛知環状鉄道"}
    if str == "330764" { return "長良川鉄道"}
    if str == "330863" { return "名鉄各務原線"}
    if str == "330866" { return "名鉄犬山線"}
    if str == "330867" { return "名鉄広見線"}
    if str == "330869" { return "名鉄小牧線"}
    if str == "330871" { return "名鉄瀬戸線"}
    if str == "330887" { return "明知鉄道"}
    if str == "331002" { return "名古屋市営上飯田線"}
    if str == "331058" { return "東部丘陵線リニモ"}
    if str == "340113" { return "ＪＲ飯田線"}
    if str == "340114" { return "ＪＲ武豊線"}
    if str == "340842" { return "豊橋鉄道渥美線"}
    if str == "340843" { return "豊橋鉄道東田本線"}
    if str == "340862" { return "名鉄河和線"}
    if str == "340864" { return "名鉄蒲郡線"}
    if str == "340868" { return "名鉄三河線"}
    if str == "340870" { return "名鉄常滑線"}
    if str == "340872" { return "名鉄西尾線"}
    if str == "340874" { return "名鉄知多新線"}
    if str == "340875" { return "名鉄築港線"}
    if str == "340883" { return "名鉄豊川線"}
    if str == "340884" { return "名鉄豊田線"}
    if str == "341057" { return "名鉄空港線"}
    if str == "350102" { return "ＪＲ関西本線"}
    if str == "350103" { return "ＪＲ紀勢本線"}
    if str == "350106" { return "ＪＲ参宮線"}
    if str == "350115" { return "ＪＲ名松線"}
    if str == "350244" { return "伊勢鉄道"}
    if str == "350305" { return "伊賀鉄道"}
    if str == "350310" { return "近鉄山田線"}
    if str == "350311" { return "近鉄志摩線"}
    if str == "350316" { return "近鉄鳥羽線"}
    if str == "350320" { return "近鉄湯の山線"}
    if str == "350323" { return "四日市あすなろう鉄道内部線"}
    if str == "350326" { return "四日市あすなろう鉄道八王子線"}
    if str == "350327" { return "三岐鉄道北勢線"}
    if str == "350328" { return "近鉄名古屋線"}
    if str == "350330" { return "近鉄鈴鹿線"}
    if str == "350669" { return "三岐鉄道三岐線"}
    if str == "351028" { return "名古屋臨海あおなみ線"}
    if str == "360107" { return "ＪＲ身延線"}
    if str == "360117" { return "ＪＲ伊東線"}
    if str == "360245" { return "伊豆急行線"}
    if str == "360246" { return "伊豆箱根鉄道駿豆線"}
    if str == "360260" { return "遠州鉄道"}
    if str == "360268" { return "岳南電車"}
    if str == "360730" { return "静岡鉄道"}
    if str == "360739" { return "大井川鉄道本線"}
    if str == "360777" { return "天竜浜名湖線"}
    if str == "360918" { return "大井川鉄道井川線"}
    if str == "910118" { return "ＪＲ烏山線"}
    if str == "910135" { return "ＪＲ吾妻線"}
    if str == "910150" { return "ＪＲ上越線"}
    if str == "910152" { return "ＪＲ信越本線"}
    if str == "910157" { return "ＪＲ水郡線"}
    if str == "910158" { return "ＪＲ水戸線"}
    if str == "910193" { return "ＪＲ日光線"}
    if str == "910208" { return "ＪＲ両毛線"}
    if str == "910240" { return "わたらせ渓谷鉄道"}
    if str == "910257" { return "ひたちなか海浜鉄道"}
    if str == "910270" { return "関東鉄道常総線"}
    if str == "910271" { return "関東鉄道竜ヶ崎線"}
    if str == "910680" { return "鹿島臨海鉄道大洗鹿島線"}
    if str == "910693" { return "上信電鉄"}
    if str == "910695" { return "上毛電気鉄道線"}
    if str == "910698" { return "真岡鉄道"}
    if str == "910799" { return "東武宇都宮線"}
    if str == "910801" { return "東武鬼怒川線"}
    if str == "910803" { return "東武桐生線"}
    if str == "910804" { return "東武佐野線"}
    if str == "910806" { return "東武小泉線"}
    if str == "910888" { return "野岩鉄道会津鬼怒川線"}
    if str == "990102" { return "ＪＲ大和路線"}
    if str == "990168" { return "ＪＲ総武線快速"}
    if str == "990188" { return "ＪＲ宇都宮線"}
    return ""
}

func master_covertStationUnitCdToString(_ str: String) -> String {
    
    return ""
}

func master_covertHireTypeCdToString(_ str: String) -> String {
    
    return ""
}
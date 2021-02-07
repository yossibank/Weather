enum Prefecture: String, CaseIterable {
    /* 北海道地方 */
    case hokkaido
    /* 東北地方 */
    case aomori
    case iwate
    case miyagi
    case akita
    case yamagata
    case fukushima
    /* 関東地方 */
    case ibaraki
    case tochigi
    case gunma
    case saitama
    case chiba
    case tokyo
    case kanagawa
    /* 中部地方 */
    case niigata
    case toyama
    case ishikawa
    case fukui
    case yamanashi
    case nagano
    case gifu
    case shizuoka
    case aichi
    /* 関西地方 */
    case mie
    case shiga
    case kyoto
    case osaka
    case hyogo
    case nara
    case wakayama
    /* 中国地方 */
    case tottori
    case shimane
    case okayama
    case hiroshima
    case yamaguchi
    /*　四国地方 */
    case tokushima
    case kagawa
    case ehime
    case kochi
    /* 九州地方 */
    case fukuoka
    case saga
    case nagasaki
    case kumamoto
    case oita
    case miyazaki
    case kagoshima
    case okinawa

    var name: String {

        switch self {

        case .hokkaido : return "北海道"
        case .aomori   : return "青森県"
        case .iwate    : return "岩手県"
        case .miyagi   : return "宮城県"
        case .akita    : return "秋田県"
        case .yamagata : return "山形県"
        case .fukushima: return "福島県"
        case .ibaraki  : return "茨城県"
        case .tochigi  : return "栃木県"
        case .gunma    : return "群馬県"
        case .saitama  : return "埼玉県"
        case .chiba    : return "千葉県"
        case .tokyo    : return "東京都"
        case .kanagawa : return "神奈川県"
        case .niigata  : return "新潟県"
        case .toyama   : return "富山県"
        case .ishikawa : return "石川県"
        case .fukui    : return "福井県"
        case .yamanashi: return "山梨県"
        case .nagano   : return "長野県"
        case .gifu     : return "岐阜県"
        case .shizuoka : return "静岡県"
        case .aichi    : return "愛知県"
        case .mie      : return "三重県"
        case .shiga    : return "滋賀県"
        case .kyoto    : return "京都都"
        case .osaka    : return "大阪府"
        case .hyogo    : return "兵庫県"
        case .nara     : return "奈良県"
        case .wakayama : return "和歌山県"
        case .tottori  : return "鳥取県"
        case .shimane  : return "島根県"
        case .okayama  : return "岡山県"
        case .hiroshima: return "広島県"
        case .yamaguchi: return "山口県"
        case .tokushima: return "徳島県"
        case .kagawa   : return "香川県"
        case .ehime    : return "愛媛県"
        case .kochi    : return "高知県"
        case .fukuoka  : return "福岡県"
        case .saga     : return "佐賀県"
        case .nagasaki : return "長崎県"
        case .kumamoto : return "熊本県"
        case .oita     : return "大分県"
        case .miyazaki : return "宮崎県"
        case .kagoshima: return "鹿児島県"
        case .okinawa  : return "沖縄県"

        }
    }

    var apiName: String {

        switch self {

        default:
            return rawValue.prefix(1).uppercased() + rawValue.dropFirst()

        }
    }
}

enum Area: CaseIterable {
    case hokkaido
    case tohoku
    case kanto
    case chubu
    case kansai
    case chugoku
    case shikoku
    case kyusyu
    
    var name: String {
        
        switch self {
        
        case .hokkaido: return "北海道地方"
        case .tohoku:   return "東北地方"
        case .kanto:    return "関東地方"
        case .chubu:    return "中部地方"
        case .kansai:   return "関西地方"
        case .chugoku:  return "中国地方"
        case .shikoku:  return "四国地方"
        case .kyusyu:   return "九州地方"

        }
    }

    var id: Int {

        switch self {

        case .hokkaido: return 0
        case .tohoku:   return 1
        case .kanto:    return 2
        case .chubu:    return 3
        case .kansai:   return 4
        case .chugoku:  return 5
        case .shikoku:  return 6
        case .kyusyu:   return 7

        }
    }
}

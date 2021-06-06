struct DetailViewData {
    var date: Double
    var weatherImageUrlString: String
    var weatherName: WeatherDescription
    var highestTemperature: Double
    var lowestTemperature: Double
}

enum WeatherDescription: String, CaseIterable {
    case thunderstorm = "thunderstorm"
    case drizzle      = "Drizzle"
    case rain         = "Rain"
    case snow         = "Snow"
    case mist         = "Mist"
    case smoke        = "Smoke"
    case haze         = "Haze"
    case fog          = "Fog"
    case sand         = "Sand"
    case dust         = "Dust"
    case ash          = "Ash"
    case squall       = "Squall"
    case tornado      = "Tronado"
    case clear        = "Clear"
    case clouds       = "Clouds"
    case unknown      = "Unknown"

    var description: String {

        switch self {

        case .thunderstorm: return "雷雨"
        case .drizzle:      return "霧雨"
        case .rain:         return "雨"
        case .snow:         return "雪"
        case .mist:         return "霧"
        case .smoke:        return "煙霧"
        case .haze:         return "霧"
        case .fog:          return "霧"
        case .sand:         return "黄砂"
        case .dust:         return "ダスト"
        case .ash:          return "火山灰"
        case .squall:       return "スコール"
        case .tornado:      return "竜巻"
        case .clear:        return "晴れ"
        case .clouds:       return "曇り"
        case .unknown:      return "不明"

        }
    }
}

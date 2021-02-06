struct DetailViewData {
    var date: Double
    var weatherImageUrlString: String
    var weatherName: String
    var highestTemperature: Double
    var lowestTemperature: Double
}

enum WeatherDescription: String {
    case clearKey
    case fewClouds
    case scatteredCoulds
    case brokenClouds
    case showerRain
    case rain
    case thunderstorm
    case snow
    case mist
    
    var description: String? {

        switch self {

        case .clearKey:        return "晴れ"
        case .fewClouds:       return "わずかに曇り"
        case .scatteredCoulds: return "曇り"
        case .brokenClouds:    return "割れ雲"
        case .showerRain:      return "にわか雨"
        case .rain:            return "雨"
        case .thunderstorm:    return "雷"
        case .snow:            return "雪"
        case .mist:            return "霧"
        }
    }
}

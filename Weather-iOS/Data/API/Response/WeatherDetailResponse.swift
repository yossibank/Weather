struct WeatherDetailResponse: Decodable {
    var weather: [Weather]
    var main: Main
    var dt: Double

    struct Weather: Decodable {
        var id: Int
        var main: String
        var description: String
        var icon: String
    }

    struct Main: Decodable {
        /* ケルビンで出力される(摂氏0℃ = 273.15ケルビン度)*/
        var temp: Double
        var tempMin: Double
        var tempMax: Double
    }
}

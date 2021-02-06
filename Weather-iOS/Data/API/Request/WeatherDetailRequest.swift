struct WeatherDetailRequest: BaseRequest {

    typealias Response = WeatherDetailResponse

    struct Request: Encodable {
        var q: String
        var appid: String = Resources.Strings.API.apiKey
    }
    
    var path: String { "" }
    
    var method: HttpMethod { .get }
}

import Foundation

enum DateFormatType: String {
    case yearToDayOfWeekJapanase = "yyyy年MM月dd日HH時"
}

extension Date {

    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter
    }

    func toConvertString(
        with dateFormatType: DateFormatType? = nil
    ) -> String {
        let dateFormatter = self.dateFormatter
        dateFormatter.dateFormat = dateFormatType?.rawValue ?? dateFormatter.dateFormat
        return dateFormatter.string(from: self)
    }
}

extension Date {

    static func fromConvertToDate(time: Double) -> Date {
        return Date(timeIntervalSince1970: time)
    }
}

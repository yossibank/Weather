import Foundation

extension Double {

    static func convertCelsiusToString(_ kelvinDegree: Double) -> String {
        String(format: "%.1f", kelvinDegree - 273.15)
    }
}

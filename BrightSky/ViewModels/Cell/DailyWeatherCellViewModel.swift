//
//  DailyWeatherCellViewModel.swift
//  BrightSky
//
//  Created by NJ Development on 28/09/23.
//

import Foundation
import WeatherKit

final class DailyWeatherCellViewModel {
    private let model: DayWeather
    private let unit: UnitTemperature
    
    init(model: DayWeather, unit: UnitTemperature = .celsius) {
        self.model = model
        self.unit = unit
    }
    
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        return formatter
    }()
    
    public var iconName: String {
        model.symbolName
    }
    
    public var temperature: String {
        "\(UnitConverter.shared.convertUnit(for: model.lowTemperature, with: unit)) - \(UnitConverter.shared.convertUnit(for: model.highTemperature, with: unit))"
    }
    
    public var day: String {
        let day = Calendar.current.component(.weekday, from: model.date)
        return weekday(from: day)
    }
    
    private func weekday(from day: Int) -> String {
        switch day {
        case 1:
            return "Monday"
        case 2:
            return "Tuesday"
        case 3:
            return "Wednesday"
        case 4:
            return "Thursday"
        case 5:
            return "Friday"
        case 6:
            return "Saturday"
        case 7:
            return "Sunday"
        default:
            return "Unavailable"
        }
    }
}

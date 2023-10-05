//
//  HourlyWeatherCellViewModel.swift
//  BrightSky
//
//  Created by NJ Development on 28/09/23.
//

import Foundation
import WeatherKit

final class HourlyWeatherCellViewModel {
    private let model: HourWeather
    private let unit: UnitTemperature
    
    init(model: HourWeather, unit: UnitTemperature = .celsius) {
        self.model = model
        self.unit = unit
    }
    
    public var iconName: String {
        model.symbolName
    }
    
    public var temperature: String {
        return UnitConverter.shared.convertUnit(for: model.temperature, with: unit)
    }
    
    public var hour: String {
        let hour = Calendar.current.component(.hour, from: model.date)
        return "\(hour):00"
    }
}

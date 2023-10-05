//
//  CurrentWeatherCellViewModel.swift
//  BrightSky
//
//  Created by NJ Development on 28/09/23.
//

import Foundation
import WeatherKit

final class CurrentWeatherCellViewModel {
    private let model: CurrentWeather
    private let unit: UnitTemperature
    
    init(model: CurrentWeather, unit: UnitTemperature = .celsius) {
        self.model = model
        self.unit = unit
    }
    
    public var temperature: String {
        return UnitConverter.shared.convertUnit(for: model.temperature, with: unit)
    }
    
    public var condition: String {
        return model.condition.description
    }
    
    public var iconName: String {
        return model.symbolName
    }
}

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
    
    init(model: CurrentWeather) {
        self.model = model
    }
    
    public var temperature: String {
        return model.temperature.description
    }
    
    public var condition: String {
        return model.condition.description
    }
    
    public var iconName: String {
        return model.symbolName
    }
}

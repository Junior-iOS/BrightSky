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
    
    init(model: DayWeather) {
        self.model = model
    }
}

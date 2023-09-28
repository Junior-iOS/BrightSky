//
//  CurrentWeatherViewModel.swift
//  BrightSky
//
//  Created by NJ Development on 28/09/23.
//

import Foundation

enum CurrentWeatherViewModel {
    case current(viewModel: CurrentWeatherCellViewModel)
    case hourly(viewModel: [HourlyWeatherCellViewModel])
    case daily(viewModel: [DailyWeatherCellViewModel])
}

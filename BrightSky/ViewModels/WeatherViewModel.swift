//
//  WeatherViewModel.swift
//  BrightSky
//
//  Created by NJ Development on 28/09/23.
//

import Foundation

final class WeatherViewModel {
    func getLocation(from weatherView: WeatherView) {
        LocationManager.shared.getCurrentLocation { location in
            WeatherManager.shared.getWeather(for: location) {
                DispatchQueue.main.async {
                    guard let currentWeather = WeatherManager.shared.currentWeather else { return }
                    let dailyWeather = WeatherManager.shared.dailyWeather
                    let hourlyWeather = WeatherManager.shared.hourlyWeather
                    
                    weatherView.configure(with: [
                        .current(viewModel: .init(model: currentWeather)),
                        .daily(viewModel: dailyWeather.compactMap({ .init(model: $0) })),
                        .hourly(viewModel: hourlyWeather.compactMap({ .init(model: $0) })),
                    ])
                }
            }
        }
    }
}

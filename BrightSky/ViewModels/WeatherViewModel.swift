//
//  WeatherViewModel.swift
//  BrightSky
//
//  Created by NJ Development on 28/09/23.
//

import Foundation

final class WeatherViewModel {
    func getLocation(from weatherView: WeatherView, unit: UnitTemperature) {
        LocationManager.shared.getCurrentLocation { location in
            WeatherManager.shared.getWeather(for: location) {
                DispatchQueue.main.async {
                    guard let currentWeather = WeatherManager.shared.currentWeather else { return }
                    let hourlyWeather = WeatherManager.shared.hourlyWeather
                    let dailyWeather = WeatherManager.shared.dailyWeather
                    
                    var viewModels: [CurrentWeatherViewModel] = [
                        .current(viewModel: .init(model: currentWeather, unit: unit)),
                        .hourly(viewModel: hourlyWeather.compactMap({ .init(model: $0, unit: unit) }))
                    ]
                    weatherView.configure(with: viewModels)
                    
                    IAPManager.shared.isSubscribed { subscribed in
                        if subscribed {
                            viewModels.append(.daily(viewModel: dailyWeather.compactMap({ .init(model: $0, unit: unit) })))
                            weatherView.configure(with: viewModels)
                        }
                    }
                }
            }
        }
    }
}

//
//  WeatherViewModel.swift
//  BrightSky
//
//  Created by NJ Development on 28/09/23.
//

import Foundation

protocol WeatherViewDelegate: AnyObject {
    func updateView()
}

final class WeatherViewModel {
    weak var delegate: WeatherViewDelegate?
    
    func getLocation(from weatherView: WeatherView, unit: UnitTemperature) {
        LocationManager.shared.getCurrentLocation { location in
            WeatherManager.shared.getWeather(for: location) {
                DispatchQueue.main.async { [weak self] in
                    guard let currentWeather = WeatherManager.shared.currentWeather else { return }
                    let hourlyWeather = WeatherManager.shared.hourlyWeather
                    let dailyWeather = WeatherManager.shared.dailyWeather
                    
                    weatherView.configure(with: [
                        .current(viewModel: .init(model: currentWeather, unit: unit)),
                        .hourly(viewModel: hourlyWeather.compactMap({ .init(model: $0, unit: unit) })),
                        .daily(viewModel: dailyWeather.compactMap({ .init(model: $0, unit: unit) }))
                    ])
                    
                    self?.delegate?.updateView()
                }
            }
        }
    }
}

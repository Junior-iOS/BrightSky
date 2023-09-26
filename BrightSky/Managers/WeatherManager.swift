//
//  WeatherManager.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import Foundation
import CoreLocation
import WeatherKit

final class WeatherManager: NSObject {
    static let shared = WeatherManager()
    let service = WeatherService.shared
    
    private override init() {}
    
    func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await service.weather(for: location)
                print("Current: ", result.currentWeather)
                print("Hourly: ", result.hourlyForecast)
                print("Daily: ", result.dailyForecast)
                completion()
            } catch {
                print(String(describing: error.localizedDescription))
            }
        }
    }
}

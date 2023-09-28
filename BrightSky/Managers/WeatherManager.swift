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
    
    public private(set) var currentWeather: CurrentWeather?
    public private(set) var hourlyWeather: [HourWeather] = []
    public private(set) var dailyWeather: [DayWeather] = []
    
    private override init() {}
    
    func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await service.weather(for: location)
                
                self.currentWeather = result.currentWeather
                self.hourlyWeather = result.hourlyForecast.forecast
                self.dailyWeather = result.dailyForecast.forecast
                
                completion()
            } catch {
                print(String(describing: error.localizedDescription))
            }
        }
    }
}

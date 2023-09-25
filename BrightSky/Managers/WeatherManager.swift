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
    
    private override init() {}
    
    func getWeather(for location: CLLocation) {
        
    }
}

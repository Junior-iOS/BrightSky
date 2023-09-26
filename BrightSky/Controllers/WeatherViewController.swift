//
//  WeatherViewController.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let weatherView = WeatherView()
    
    override func loadView() {
        super.loadView()
        self.view = weatherView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
    }
    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            WeatherManager.shared.getWeather(for: location) {
                
            }
        }
    }
}

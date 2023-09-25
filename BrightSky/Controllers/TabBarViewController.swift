//
//  TabBarViewController.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        let weatherVC = WeatherViewController()
        weatherVC.title = "Weather"
        
        let settingsVC = SettingsViewController()
        settingsVC.title = "Settings"
        
        let weatherNavigation = UINavigationController(rootViewController: weatherVC)
        weatherNavigation.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud.sun.circle"), tag: 1)
        
        let settingsNavigation = UINavigationController(rootViewController: settingsVC)
        settingsNavigation.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear.circle"), tag: 2)
        
        setViewControllers([
            weatherNavigation,
            settingsNavigation
        ], animated: true)
    }
    
}

//
//  LocationManager.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject {
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    private var locationFetchCompletion: ((CLLocation) -> Void)?
    
    private var location: CLLocation? {
        didSet {
            guard let location else { return }
            locationFetchCompletion?(location)
        }
    }
    
    private override init() {}
    
    public func getCurrentLocation(completion: @escaping (CLLocation) -> Void) {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        locationFetchCompletion = completion
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.location = location
        locationManager.stopUpdatingLocation()
    }
}

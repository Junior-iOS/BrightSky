//
//  UnitConverter.swift
//  BrightSky
//
//  Created by NJ Development on 05/10/23.
//

import Foundation

final class UnitConverter {
    static let shared = UnitConverter()
    
    private init () {}

    func convertUnit(for temp: Measurement<UnitTemperature>, with unit: UnitTemperature) -> String {
        let degrees = unit == .celsius ? "ºC" : "ºF"
        return "\(Int(temp.converted(to: unit).value)) \(degrees)"
    }
}

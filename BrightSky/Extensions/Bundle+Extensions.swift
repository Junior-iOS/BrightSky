//
//  Bundle+Extensions.swift
//  BrightSky
//
//  Created by NJ Development on 09/10/23.
//

import Foundation

extension Bundle {
    var secret: String {
        self.object(forInfoDictionaryKey: "SECRET") as? String ?? ""
    }
}

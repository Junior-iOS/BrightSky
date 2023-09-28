//
//  SettingsViewViewModel.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import Foundation

struct SettingsViewViewModel {
    let options: [SettingOption]
}

enum SettingOption: CaseIterable {
    case upgrade
    case privacyPolicy
    case terms
    case contact
    case getHelp
    case rateApp
    
    var title: String {
        switch self {
        case .upgrade:
            "Upgrade to Pro"
        case .privacyPolicy:
            "Privacy Policy"
        case .terms:
            "Terms os Use"
        case .contact:
            "Contact Us"
        case .getHelp:
            "Get Help"
        case .rateApp:
            "Rate App"
        }
    }
}

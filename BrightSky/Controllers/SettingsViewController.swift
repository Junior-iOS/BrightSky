//
//  SettingsViewController.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import UIKit

class SettingsViewController: UIViewController {

    private let settingsView = SettingsView()
    
    override func loadView() {
        super.loadView()
        self.view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let viewModel = SettingsViewViewModel(options: SettingOption.allCases)
        settingsView.configure(with: viewModel)
        settingsView.delegate = self
    }
}

// MARK: - SETTINGSVIEW DELEGATE
extension SettingsViewController: SettingsViewDelegate {
    func settingsView(_ settingView: SettingsView, didSelect option: SettingOption) {
        print(String(describing: option))
    }
}

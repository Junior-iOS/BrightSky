//
//  WeatherViewController.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import UIKit
import RevenueCat
import RevenueCatUI

class WeatherViewController: UIViewController {
    
    enum Degrees {
        case celsius
        case fahreinheit
    }
    
    private let weatherView = WeatherView()
    private let viewModel: WeatherViewModel
    private var degrees: Degrees = .celsius
    
    override func loadView() {
        super.loadView()
        self.view = weatherView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addBarButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getLocation(from: weatherView, unit: .celsius)
    }
    
    init(viewModel: WeatherViewModel = WeatherViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        nil
    }
    
    private func addBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "thermometer.transmission"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapChangeDeggres))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "crown"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapUpgrade))
    }
    
    @objc private func didTapChangeDeggres() {
        if degrees == .celsius {
            degrees = .fahreinheit
            viewModel.getLocation(from: weatherView, unit: .fahrenheit)
        } else {
            degrees = .celsius
            viewModel.getLocation(from: weatherView, unit: .celsius)
        }
    }
    
    @objc private func didTapUpgrade() {
        let vc = PaywallViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: PaywallController Delegate
extension WeatherViewController: PaywallViewControllerDelegate {
    func paywallViewController(_ controller: PaywallViewController, didFinishPurchasingWith customerInfo: CustomerInfo) {
        navigationItem.rightBarButtonItem = nil
        controller.navigationController?.popToRootViewController(animated: true)
    }
    
    func paywallViewController(_ controller: PaywallViewController, didFinishRestoringWith customerInfo: CustomerInfo) {
        controller.navigationController?.popToRootViewController(animated: true)
    }
}

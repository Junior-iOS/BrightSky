//
//  WeatherViewController.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import UIKit

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
        viewModel.getLocation(from: weatherView, unit: .celsius)
        addBarButtonItem()
    }
    
    init(viewModel: WeatherViewModel = WeatherViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
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
        print("didTapUpgrade")
    }
}

extension WeatherViewController: WeatherViewDelegate {
    func updateView() {
        weatherView.collectionView?.reloadData()
    }
}

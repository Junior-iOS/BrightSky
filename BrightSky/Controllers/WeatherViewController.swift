//
//  WeatherViewController.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let weatherView = WeatherView()
    private let viewModel: WeatherViewModel
    
    override func loadView() {
        super.loadView()
        self.view = weatherView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getLocation(from: weatherView)
    }
    
    init(viewModel: WeatherViewModel = WeatherViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        nil
    }
}

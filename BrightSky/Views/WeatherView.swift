//
//  WeatherView.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import UIKit

class WeatherView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        nil
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
    }

}

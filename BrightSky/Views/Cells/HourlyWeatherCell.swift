//
//  WeatherViewCell.swift
//  BrightSky
//
//  Created by NJ Development on 28/09/23.
//

import UIKit

class HourlyWeatherCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        nil
    }
    
    public func configure(with viewModel: HourlyWeatherCellViewModel) {
        
    }
}

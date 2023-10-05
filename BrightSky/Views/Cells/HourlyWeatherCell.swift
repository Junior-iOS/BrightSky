//
//  WeatherViewCell.swift
//  BrightSky
//
//  Created by NJ Development on 28/09/23.
//

import UIKit

class HourlyWeatherCell: UICollectionViewCell {
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        nil
    }
    
    private func addConstraints() {
        contentView.addSubviews(timeLabel, iconImage, temperatureLabel)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            iconImage.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 32),
            
            temperatureLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    public func configure(with viewModel: HourlyWeatherCellViewModel) {
        iconImage.image = UIImage(systemName: viewModel.iconName)
        temperatureLabel.text = viewModel.temperature
        timeLabel.text = viewModel.hour
    }
}

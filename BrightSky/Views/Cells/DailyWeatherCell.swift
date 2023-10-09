//
//  DailyWeatherCell.swift
//  BrightSky
//
//  Created by NJ Development on 28/09/23.
//

import UIKit

class DailyWeatherCell: UICollectionViewCell {
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
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
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.addSubviews(dayLabel, iconImage, temperatureLabel)
        
        NSLayoutConstraint.activate([
            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            dayLabel.heightAnchor.constraint(equalToConstant: 40),
            dayLabel.widthAnchor.constraint(equalToConstant: 130),
            
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImage.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 10),
            iconImage.heightAnchor.constraint(equalToConstant: 32),
            
            temperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
    
    public func configure(with viewModel: DailyWeatherCellViewModel) {
        temperatureLabel.text = viewModel.temperature
        iconImage.image = UIImage(systemName: viewModel.iconName)
        dayLabel.text = viewModel.day
    }
}

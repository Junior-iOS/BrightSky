//
//  CurrentWeatjherCell.swift
//  BrightSky
//
//  Created by NJ Development on 28/09/23.
//

import UIKit

class CurrentWeatherCell: UICollectionViewCell {
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 62, weight: .medium)
        return label
    }()
    
    private lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 34, weight: .regular)
        return label
    }()
    
    private lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var conditionStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImage, conditionLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.temperatureLabel.text = nil
        self.iconImage.image = nil
        self.conditionLabel.text = nil
    }
    
    private func addConstraints() {
        contentView.addSubviews(temperatureLabel, conditionStack)
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            conditionStack.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            conditionStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            conditionStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            iconImage.widthAnchor.constraint(equalToConstant: 55),
            iconImage.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    public func configure(with viewModel: CurrentWeatherCellViewModel) {
        temperatureLabel.text = viewModel.temperature
        iconImage.image = UIImage(systemName: viewModel.iconName)
        conditionLabel.text = viewModel.condition
    }
}

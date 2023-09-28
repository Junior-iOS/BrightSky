//
//  WeatherView.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import UIKit

class WeatherView: UIView {
    private var collectionView: UICollectionView?
    private var viewModel: [CurrentWeatherViewModel] = []
    
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
        createCollectionView()
    }
    
    private func createCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            self.layout(for: sectionIndex)
        }
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.register(CurrentWeatherCell.self, forCellWithReuseIdentifier: CurrentWeatherCell.identifier)
        collection.register(HourlyWeatherCell.self, forCellWithReuseIdentifier: HourlyWeatherCell.identifier)
        collection.register(DailyWeatherCell.self, forCellWithReuseIdentifier: DailyWeatherCell.identifier)
        self.collectionView = collection
        
        setupConstraints()
    }
    
    private func layout(for sectionIndex: Int) -> NSCollectionLayoutSection {
        let section = CurrentWeatherSection.allCases[sectionIndex]
        
        switch section {
        case .current:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                  heightDimension: .fractionalWidth(0.75)),
                subitems: [item])
            
            return NSCollectionLayoutSection(group: group)
        case .hourly:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(widthDimension: .fractionalWidth(0.25),
                                  heightDimension: .absolute(150)),
                subitems: [item])
            group.contentInsets = .init(top: 1, leading: 2, bottom: 1, trailing: 2)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        case .daily:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                  heightDimension: .absolute(100)),
                subitems: [item])
            group.contentInsets = .init(top: 1, leading: 2, bottom: 1, trailing: 2)
            
            return NSCollectionLayoutSection(group: group)
        }
    }
    
    private func setupConstraints() {
        guard let collectionView else { return }
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    public func configure(with viewModel: [CurrentWeatherViewModel]) {
        self.viewModel = viewModel
        collectionView?.reloadData()
    }
}

// MARK: - UICOLLECTIONVIEW DATASOURCE
extension WeatherView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch viewModel[section] {
        case .current: return 1
        case .daily(let viewModel): return viewModel.count
        case .hourly(let viewModel): return viewModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel[indexPath.section] {
        case .current(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CurrentWeatherCell.identifier,
                for: indexPath) as? CurrentWeatherCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: viewModel)
            return cell
        case .daily(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DailyWeatherCell.identifier,
                for: indexPath) as? DailyWeatherCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: viewModels[indexPath.row])
            return cell
        case .hourly(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HourlyWeatherCell.identifier,
                for: indexPath) as? HourlyWeatherCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: viewModels[indexPath.row])
            return cell
        }
    }
}

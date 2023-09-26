//
//  SettingsView.swift
//  BrightSky
//
//  Created by NJ Development on 25/09/23.
//

import UIKit

protocol SettingsViewDelegate: AnyObject {
    func settingsView(_ settingView: SettingsView, didSelect option: SettingOption)
}

final class SettingsView: UIView {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    private var viewModel: SettingsViewViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    weak var delegate: SettingsViewDelegate?

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
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configure(with viewModel: SettingsViewViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - UITABLEVIEW DELEGATE AND DATASOURCE
extension SettingsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let option = viewModel?.options[indexPath.row] {
            delegate?.settingsView(self, didSelect: option)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.options.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let viewModel {
            cell.textLabel?.text = viewModel.options[indexPath.row].title
        }
        return cell
    }
}

//
//  RMLocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/4/23.
//

import UIKit

final class RMLocationTableViewCell: UITableViewCell {

    static let id = "RMLocationTableViewCell"
    
    private let nameLabel = UILabel()
    private let typeLabel = UILabel()
    private let dimensionLabel = UILabel()
    private let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: RMLocationTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        typeLabel.text = viewModel.type
        dimensionLabel.text = viewModel.dimension
    }
    
    private func setup() {
        backgroundColor = .systemBackground
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .label
        
        typeLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        typeLabel.textColor = .secondaryLabel
        
        dimensionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        dimensionLabel.textColor = .secondaryLabel
    }
    
    private func layout() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(dimensionLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
    }

}

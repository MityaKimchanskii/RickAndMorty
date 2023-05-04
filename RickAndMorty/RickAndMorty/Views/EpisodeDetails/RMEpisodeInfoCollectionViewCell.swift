//
//  RMEpisodeInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/3/23.
//

import UIKit

final class RMEpisodeInfoCollectionViewCell: UICollectionViewCell {
    
    static let id = "RMEpisodeInfoCollectionViewCell"
    
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemGray6
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryLabel.cgColor
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.contentMode = .center
        
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        
        valueLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }
    
    private func layout() {
        contentView.addSubviews(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(with viewModel: RMEpisodeInfoCollectionViewCellViewModel) {
        titleLabel.text =  viewModel.title
        valueLabel.text = viewModel.value
    }
}



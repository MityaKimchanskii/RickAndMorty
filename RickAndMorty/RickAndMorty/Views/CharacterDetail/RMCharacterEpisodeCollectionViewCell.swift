//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/30/23.
//

import UIKit

final class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    
    static let id = "RMCharacterEpisodeCollectionViewCell"
    
    private let nameLabel = UILabel()
    private let airDateLabel = UILabel()
    private let episodeLabel = UILabel()
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods
extension RMCharacterEpisodeCollectionViewCell {
    
    private func style() {
        contentView.backgroundColor = .systemGray5
        contentView.layer.borderColor = UIColor.systemGray.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 8
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 16, weight: .regular)
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        
        airDateLabel.translatesAutoresizingMaskIntoConstraints = false
        airDateLabel.font = .systemFont(ofSize: 16, weight: .light)
        
        episodeLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
    }
    
    private func layout() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(episodeLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(airDateLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
    
    public func configure(with viewModel: RMCharacterEpisodeCollectionViewCellViewModel) {
        viewModel.registerForData { [weak self] data in
            self?.nameLabel.text = data.name
            self?.airDateLabel.text = "Aired on "+data.air_date
            self?.episodeLabel.text = "Episode "+data.episode
        }
        viewModel.fetchEpisode()
    }
}

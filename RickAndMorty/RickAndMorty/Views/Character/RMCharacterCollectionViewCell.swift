//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/28/23.
//

import UIKit

final class RMCharacterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let id = "RMCharacterCollectionViewCell"
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
       
        style()
        layout()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupView()
    }
    
    private func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .label
        nameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.textColor = .secondaryLabel
        statusLabel.font = .systemFont(ofSize: 16, weight: .regular)

    }
    
    private func layout() {
        contentView.addSubviews(imageView, nameLabel, statusLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 190),
            
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: nameLabel.trailingAnchor, multiplier: 1),
            
            statusLabel.topAnchor.constraint(equalToSystemSpacingBelow: nameLabel.bottomAnchor, multiplier: 1),
            statusLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: statusLabel.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: statusLabel.bottomAnchor, multiplier: 1)
        ])
    }
    
    private func setupView() {
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.label.cgColor
        layer.cornerRadius = 4
        layer.shadowOffset = CGSize(width: -4, height: 4)
        layer.shadowOpacity = 0.3
        backgroundColor = .secondarySystemBackground
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        imageView.image = nil
//        nameLabel.text = nil
//        statusLabel.text = nil
//    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                let image = UIImage(data: data)
                self?.imageView.image = image
            case .failure(let error):
                print(error)
                print(error.localizedDescription)
            }
        }
    }
}

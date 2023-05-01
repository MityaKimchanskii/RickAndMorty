//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/30/23.
//

import UIKit

final class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    
    static let id = "RMCharacterInfoCollectionViewCell"
    
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
extension RMCharacterInfoCollectionViewCell {
    
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
        
    }
    
    private func style() {
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
    }
    
    private func layout() {
        
    }
}

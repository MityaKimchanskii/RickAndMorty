//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/30/23.
//

import UIKit

final class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    
    static let id = "RMCharacterEpisodeCollectionViewCell"
    
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
                                           
    public func configure(with viewModel: RMCharacterEpisodeCollectionViewCellViewModel) {
        
    }
    
    private func style() {
        
    }
    
    private func layout() {
        
    }
}

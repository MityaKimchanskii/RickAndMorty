//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/30/23.
//

import Foundation


final class RMCharacterInfoCollectionViewCellViewModel {
    
    public let value: String
    public let title: String
    
    init(value: String, title: String) {
        self.value = value
        self.title = title
    }
}

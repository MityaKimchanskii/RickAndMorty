//
//  RMCharacterEpisodeCollectionViewCellVIewModel.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/30/23.
//

import Foundation


final class RMCharacterEpisodeCollectionViewCellViewModel {
    
    private let episodeDataUrl: URL?
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
}

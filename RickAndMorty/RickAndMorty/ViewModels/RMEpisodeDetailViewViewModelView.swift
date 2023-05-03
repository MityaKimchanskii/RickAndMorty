//
//  RMEpisodeDetailViewViewModelView.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/2/23.
//

import UIKit

final class RMEpisodeDetailViewViewModel {
    
    private let endpointURL: URL?
    
    init(endpointURL: URL?) {
        self.endpointURL = endpointURL
        fetchEpisodeData()
    }
    
    private func fetchEpisodeData() {
        guard let url = endpointURL, let request = RMRequest(url: url) else { return }
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let error):
                break
            }
        }
    }
}

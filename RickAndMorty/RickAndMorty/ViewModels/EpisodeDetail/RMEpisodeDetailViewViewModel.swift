//
//  RMEpisodeDetailViewViewModelView.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/2/23.
//

import UIKit


protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}


final class RMEpisodeDetailViewViewModel {
    
    private let endpointURL: URL?
    private var dataTuple: (episode: RMEpisode, characters: [RMCharacter])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    enum SectionType {
        case information(viewModels: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewModels: [RMCharacterCollectionViewCellViewModel])
    }
    
    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    public private(set) var cellViewModels: [SectionType] = []
    
    init(endpointURL: URL?) {
        self.endpointURL = endpointURL
    }
    
    public func fetchEpisodeData() {
        guard let url = endpointURL, let request = RMRequest(url: url) else { return }
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(episode: model)
            case .failure(let error):
                print(error)
                print(error.localizedDescription)
            }
        }
    }
    
    private func createCellViewModels() {
        guard let dataTuple else { return }
        let episode = dataTuple.episode
        let characters = dataTuple.characters
        cellViewModels = [
            .information(viewModels: [
                .init(title: "Episode Name", value: episode.name),
                .init(title: "Air Date", value: episode.air_date),
                .init(title: "Episode", value: episode.episode),
                .init(title: "Created", value: episode.created)
            ]),
            .characters(viewModels: characters.compactMap({ character in
                return RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image))
            }))
        ]
    }
    
    private func fetchRelatedCharacters(episode: RMEpisode) {
        let charcterURLs = episode.characters.compactMap {
            return URL(string: $0)
        }
        
        let requests: [RMRequest] = charcterURLs.compactMap({
            return RMRequest(url: $0)
        })
        
        var characters: [RMCharacter] = []
        
        let group = DispatchGroup()
        
        for request in requests {
            group.enter()
            RMService.shared.execute(request, expecting: RMCharacter.self) { result in
                defer {
                    group.leave()
                }
                
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure:
                    break
                }
            }
        }
        
        group.notify(queue: .main) {
            self.dataTuple = (episode: episode, characters: characters)
        }
    }
}

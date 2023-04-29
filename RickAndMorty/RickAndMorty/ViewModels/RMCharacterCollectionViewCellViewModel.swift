//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/28/23.
//

import Foundation


final class RMCharacterCollectionViewCellViewModel {
    
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return characterStatus.rawValue
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                guard let data, error == nil else {
                    completion(.failure(error ?? URLError(.badServerResponse)))
                    return
                }
                
                completion(.success(data))
            }
        }.resume()
    }
}

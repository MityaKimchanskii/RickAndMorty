//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/4/23.
//

import Foundation


final class RMLocationViewViewModel {
    
    private var locations: [RMLocation] = []
    
    private var cellViewModels: [String] = []
    
    private var hasMoreResults: Bool {
        return false
    }
    
    init() {
        
    }
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }
}

//
//  RMLocationTableViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/4/23.
//

import Foundation


struct RMLocationTableViewCellViewModel: Hashable, Equatable {

    private let location: RMLocation
    
    init(location: RMLocation) {
        self.location = location
    }
    
    public var name: String {
        return "Planet name: "+location.name
    }
    
    public var type: String {
        return "Location: "+location.type
    }
    
    public var dimension: String {
        return "Dimension: "+location.dimension
    }
    
    static func == (lhs: RMLocationTableViewCellViewModel, rhs: RMLocationTableViewCellViewModel) -> Bool {
        return lhs.location.id == rhs.location.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(location.id)
        hasher.combine(dimension)
        hasher.combine(type)
    }
}

//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//

import Foundation


/// 
@frozen enum RMEndpoint: String, CaseIterable, Hashable {
    case character
    case location
    case episode
}


//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimensions: String
    let residents: [String]
    let url: String
    let crated: String
}

//
//  RMSettingsCellVeiwModel.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/3/23.
//

import UIKit

struct RMSettingsCellVeiwModel: Identifiable, Hashable {
    
    let id = UUID()
    
    public var image: UIImage? {
        return type.iconImage
    }
    
    private let type: RMSettingsOption
    
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
    
    init(type: RMSettingsOption) {
        self.type = type
    }
}

//
//  RMSettingsCellVeiwModel.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/3/23.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable {
    
    let id = UUID()
    
    public var image: UIImage? {
        return type.iconImage
    }
    
    public let onTapHandler: (RMSettingsOption) -> Void
    
    public let type: RMSettingsOption
    
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
    
    init(type: RMSettingsOption, onTapHandler: @escaping (RMSettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
    }
}

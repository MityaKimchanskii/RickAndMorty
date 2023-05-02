//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/30/23.
//

import UIKit


final class RMCharacterInfoCollectionViewCellViewModel {
    
    private let type: `Type`
    private let value: String
    
    public var title: String {
        self.type.displayTitle
    }
    
    static let dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        return formatter
    }()
    
    public var displayValue: String {
        if value.isEmpty { return "None" }
        
        if let date = Self.dateFormatter.date(from: value), type == .created {
            return Self.shortDateFormatter.string(from: date)
        }
        
        return value
    }
    
    public var tintColor: UIColor {
        return type.tintColor
    }
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case location
        case created
        case episodeCount
        
        var tintColor: UIColor {
            switch self {
                
            case .status:
                return .systemBlue
            case .gender:
                return .systemGreen
            case .type:
                return .systemYellow
            case .species:
                return .systemRed
            case .origin:
                return .systemBrown
            case .location:
                return .systemOrange
            case .created:
                return .systemMint
            case .episodeCount:
                return .systemPurple
            }
        }
        
        var iconImage: UIImage? {
            switch self {
                
            case .status:
                return UIImage(systemName: "person")
            case .gender:
                return UIImage(systemName: "figure.dress.line.vertical.figure")
            case .type:
                return UIImage(systemName: "poweroutlet.type.f")
            case .species:
                return UIImage(systemName: "highlighter")
            case .origin:
                return UIImage(systemName: "globe")
            case .location:
                return UIImage(systemName: "globe.americas")
            case .created:
                return UIImage(systemName: "calendar")
            case .episodeCount:
                return UIImage(systemName: "film")
            }
        }
        
        var displayTitle: String {
            switch self {
            case .status:
                return rawValue.uppercased()
            case .gender:
                return rawValue.uppercased()
            case .type:
                return rawValue.uppercased()
            case .species:
                return rawValue.uppercased()
            case .origin:
                return rawValue.uppercased()
            case .location:
                return rawValue.uppercased()
            case .created:
                return rawValue.uppercased()
            case .episodeCount:
                return "Episode count"
            }
        }
    }
    
    init(type: `Type`, value: String) {
        self.value = value
        self.type = type
    }
}

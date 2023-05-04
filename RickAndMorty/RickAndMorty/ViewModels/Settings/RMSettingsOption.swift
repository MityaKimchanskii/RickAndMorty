//
//  RMSettingsOption.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/3/23.
//

import UIKit

enum RMSettingsOption: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case privacy
    case apiReference
    case viewSeries
    case viewCode
    
    var targetURL: URL? {
        switch self {
        case .rateApp:
            return nil
        case .contactUs:
            return URL(string: "https://iosacademy.io")
        case .terms:
            return URL(string: "https://iosacademy.io/terms")
        case .privacy:
            return URL(string: "https://iosacademy.io/privacy")
        case .apiReference:
            return URL(string: "https://rickandmortyapi.com/api")
        case .viewSeries:
            return URL(string: "https://www.youtube.com/watch?v=lkP44RQ-gEY&list=PL5PR3UyfTWvdl4Ya_2veOB6TM16FXuv4y&index=32")
        case .viewCode:
            return URL(string: "https://github.com/AfrazCodes/RickAndMortyiOSApp")
        }
    }
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact Us"
        case .terms:
            return "Terms of Service"
        case .privacy:
            return "Privacy Policy"
        case .apiReference:
            return "API Reference"
        case .viewSeries:
            return "View Video Series"
        case .viewCode:
            return "View App Code"
        }
    }
    
    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
            return .systemPink
        case .contactUs:
            return .systemBlue
        case .terms:
            return .systemMint
        case .privacy:
            return .systemGreen
        case .apiReference:
            return .systemYellow
        case .viewSeries:
            return .systemPurple
        case .viewCode:
            return .systemBrown
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.fill")
        case .contactUs:
            return UIImage(systemName: "paperplane")
        case .terms:
            return UIImage(systemName: "doc")
        case .privacy:
            return UIImage(systemName: "lock")
        case .apiReference:
            return UIImage(systemName: "list.clipboard")
        case .viewSeries:
            return UIImage(systemName: "tv.fill")
        case .viewCode:
            return UIImage(systemName: "hammer.fill")
        }
    }
}

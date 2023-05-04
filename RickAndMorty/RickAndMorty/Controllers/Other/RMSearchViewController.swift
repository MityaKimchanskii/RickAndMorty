//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/2/23.
//

import UIKit


class RMSearchViewController: UIViewController {
    
    struct Configuration {
        enum `Type` {
            case character
            case episode
            case location
        }
        
        let type: `Type`
    }
    
    private let configuration: Configuration
    
    init(configuration: Configuration) {
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

// MARK: - Extensions
extension RMSearchViewController {
    
    private func style() {
        title = "Search"
        view.backgroundColor = .systemBackground
    }
    
    private func layout() {
        
        
        NSLayoutConstraint.activate([
            
        ])
    }
}


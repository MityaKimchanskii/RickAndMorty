//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

// MARK: - Extensions
extension RMCharacterViewController {
    
    func style() {
        view.backgroundColor = .systemBackground
        
    }
    
    func layout() {

    }
}


//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//

import UIKit

final class RMLocationViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        addSearchButton()
    }
}

// MARK: - Extensions
extension RMLocationViewController {
    
    private func style() {
        view.backgroundColor = .systemBackground
    }
    
    private func layout() {
        
        
        NSLayoutConstraint.activate([
           
        ])
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    @objc private func didTapSearch() {
        
    }
}


//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    
    private let characterListView = RMCharacterListView()
    
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
        view.addSubview(characterListView)
        
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            characterListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


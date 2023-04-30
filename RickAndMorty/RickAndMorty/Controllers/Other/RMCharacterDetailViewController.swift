//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/28/23.
//

import UIKit


final class RMCharacterDetailViewController: UIViewController {
    
    private let viewModel: RMCharacterDetailViewViewModel
    
    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

// MARK: - Extensions
extension RMCharacterDetailViewController {
    
    private func style() {
        view.backgroundColor = .systemGroupedBackground
        title = viewModel.title
    }
    
    private func layout() {
        
        
        NSLayoutConstraint.activate([
           
        ])
    }
}


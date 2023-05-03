//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/1/23.
//

import UIKit

final class RMEpisodeDetailViewController: UIViewController {
    
    private let viewModel: RMEpisodeDetailViewViewModel
    
    init(url: URL?) {
        self.viewModel = .init(endpointURL: url)
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
extension RMEpisodeDetailViewController {
    
    private func style() {
        title = "Episode"
        
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
           
        ])
    }
}


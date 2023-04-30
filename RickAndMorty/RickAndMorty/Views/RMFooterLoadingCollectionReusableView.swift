//
//  RMFooterLoadingCollectionReusableView.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/28/23.
//

import UIKit

final class RMFooterLoadingCollectionReusableView: UICollectionReusableView {
        
    static let id = "RMFooterLoadingCollectionReusableView"
    
    private let spinner = UIActivityIndicatorView(style: .large)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        backgroundColor = .systemBackground
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        
    }
    
    private func layout() {
        addSubview(spinner)
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
    public func startAnimating() {
        spinner.startAnimating()
    }
}

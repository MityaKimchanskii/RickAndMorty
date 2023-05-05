//
//  RMNoSearchResultsView.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/4/23.
//

import UIKit


final class RMNoSearchResultsView: UIView {
    
    private let viewModel = RMNoSearchResultsViewViewModel()
    
    private let iconView = UIImageView()
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RMNoSearchResultsView {
    
    private func style() {
        isHidden = true
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .systemBlue
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.text = "Hello"
    }
    
    private func layout() {
        addSubviews(iconView, label)
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 100),
            iconView.widthAnchor.constraint(equalToConstant: 100),
            
            label.topAnchor.constraint(equalToSystemSpacingBelow: iconView.bottomAnchor, multiplier: 1),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    public func configure() {
        label.text = viewModel.title
        iconView.image = viewModel.image
    }
}

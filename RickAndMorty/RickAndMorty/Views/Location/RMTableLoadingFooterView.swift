//
//  RMTableLoadingFooterView.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/7/23.
//

import UIKit

final class RMTableLoadingFooterView: UIView {

    private let spinner = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
    }
   
    private func layout() {
        addSubview(spinner)
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinner.widthAnchor.constraint(equalToConstant: 60),
            spinner.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

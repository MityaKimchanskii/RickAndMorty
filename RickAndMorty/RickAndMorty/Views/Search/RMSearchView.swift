//
//  RMSearchView.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/4/23.
//

import UIKit

protocol RMSearchViewDelegate: AnyObject {
    func rmSearchView(_ searchView: RMSearchView, didSelectOption option: RMSearchInputViewViewModel.DynamicOption)
}

final class RMSearchView: UIView {
    
    weak var delegate: RMSearchViewDelegate?
    
    private let viewModel: RMSearchViewViewModel
    
    private let noResultsView = RMNoSearchResultsView()
    private let searchInputView = RMSearchInputView()
    
    init(frame: CGRect, viewModel: RMSearchViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        style()
        layout()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RMSearchView {
    private func style() {
        backgroundColor = .systemBackground
        
        searchInputView.configure(with: .init(type: viewModel.configuration.type))
        searchInputView.translatesAutoresizingMaskIntoConstraints = false
        searchInputView.delegate = self
        
        noResultsView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubviews(noResultsView, searchInputView)
        
        NSLayoutConstraint.activate([
            searchInputView.topAnchor.constraint(equalTo: topAnchor),
            searchInputView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchInputView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchInputView.heightAnchor.constraint(equalToConstant: viewModel.configuration.type == .episode ? 50 : 100),
            
            noResultsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noResultsView.centerYAnchor.constraint(equalTo: centerYAnchor),
            noResultsView.widthAnchor.constraint(equalToConstant: 200),
            noResultsView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    public func presentKeyboard() {
        searchInputView.presentKeyboard()
    }
}

extension RMSearchView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension RMSearchView: RMSearchInputViewDelegate {
    func rmSearchInputView(_ inputView: RMSearchInputView, didSelectOption option: RMSearchInputViewViewModel.DynamicOption) {
        delegate?.rmSearchView(self, didSelectOption: option)
    }
}

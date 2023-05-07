//
//  RMSearchView.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/4/23.
//

import UIKit

protocol RMSearchViewDelegate: AnyObject {
    func rmSearchView(_ searchView: RMSearchView, didSelectOption option: RMSearchInputViewViewModel.DynamicOption)
    func rmSearchView(_ searchView: RMSearchView, didSelect location: RMLocation)
}

final class RMSearchView: UIView {
    
    weak var delegate: RMSearchViewDelegate?
    private let viewModel: RMSearchViewViewModel
    private let noResultsView = RMNoSearchResultsView()
    private let searchInputView = RMSearchInputView()
    private let resultsView = RMSearchResultsView()
    
    init(frame: CGRect, viewModel: RMSearchViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        style()
        layout()
        setUpHandlers(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RMSearchView {
    private func style() {
        backgroundColor = .systemBackground
        
        viewModel.registerOptionChangeBlock { tuple in
            print(String(describing: tuple))
            self.searchInputView.update(option: tuple.0, value: tuple.1)
        }
        
        searchInputView.configure(with: .init(type: viewModel.configuration.type))
        searchInputView.translatesAutoresizingMaskIntoConstraints = false
        searchInputView.delegate = self
        
        resultsView.delegate = self
        
        noResultsView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubviews(resultsView, noResultsView, searchInputView)
        
        NSLayoutConstraint.activate([
            searchInputView.topAnchor.constraint(equalTo: topAnchor),
            searchInputView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchInputView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchInputView.heightAnchor.constraint(equalToConstant: viewModel.configuration.type == .episode ? 50 : 100),
            
            resultsView.topAnchor.constraint(equalToSystemSpacingBelow: searchInputView.bottomAnchor, multiplier: 1),
            resultsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            resultsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            resultsView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            noResultsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noResultsView.centerYAnchor.constraint(equalTo: centerYAnchor),
            noResultsView.widthAnchor.constraint(equalToConstant: 200),
            noResultsView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    public func presentKeyboard() {
        searchInputView.presentKeyboard()
    }
    
    private func setUpHandlers(viewModel: RMSearchViewViewModel) {
        viewModel.registerOptionChangeBlock { tuple in
            self.searchInputView.update(option: tuple.0, value: tuple.1)
        }

        viewModel.registerSearchResultHandler { [weak self] result in
            DispatchQueue.main.async {
                self?.resultsView.configure(with: result)
                self?.noResultsView.isHidden = true
                self?.resultsView.isHidden = false
            }
        }

        viewModel.registerNoResultsHandler { [weak self] in
            DispatchQueue.main.async {
                self?.noResultsView.isHidden = false
                self?.resultsView.isHidden = true
            }
        }
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
    
    func rmSearchInputView(_ inputView: RMSearchInputView, didChangeSearchText text: String) {
        viewModel.set(query: text)
    }
    
    func rmSearchInputViewDedTapSearchKeyboardButton(_ inputView: RMSearchInputView) {
        viewModel.executeSearch()
    }
}

extension RMSearchView: RMSearchResultsViewDelegate {
    func rmSearchResultsView(_ resultsView: RMSearchResultsView, didTapLocationAt index: Int) {
        guard let locationModel = viewModel.loctionSearchResult(at: index) else { return }
        delegate?.rmSearchView(self, didSelect: locationModel)
    }
}

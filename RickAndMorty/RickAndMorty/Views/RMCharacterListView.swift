//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//


import UIKit


final class RMCharacterListView: UIView {
    
    private let viewModel = RMCharacterListViewViewModel()
    
    private let spinner = UIActivityIndicatorView(style: .large)
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchCharacters()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RMCharacterListView {
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.id)
        collectionView.isHidden = true
        collectionView.alpha = 0
        
    }
    
    private func layout() {
        addSubviews(spinner, collectionView)
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
//            self.spinner.stopAnimating()
//
//            self.collectionView.isHidden = false
//
//            UIView.animate(withDuration: 0.5) {
//                self.collectionView.alpha = 1
//            }
//        })
    }
}

extension RMCharacterListView: RMCharacterListViewViewModelDelegate {
    func didLoadInitialCharacters() {
        collectionView.reloadData()
        spinner.stopAnimating()
        collectionView.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.collectionView.alpha = 1
        }
       
    }
}

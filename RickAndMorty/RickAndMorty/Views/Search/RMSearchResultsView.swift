//
//  RMSearchResultsView.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/6/23.
//

import UIKit


protocol RMSearchResultsViewDelegate: AnyObject {
    func rmSearchResultsView(_ resultsView: RMSearchResultsView, didTapLocationAt index: Int)
}

final class RMSearchResultsView: UIView {
    
    weak var delegate: RMSearchResultsViewDelegate?
    
    private var viewModel: RMSearchResultViewModel? {
        didSet {
            self.processViewModel()
        }
    }
    
    private var locationCellViewModels: [RMLocationTableViewCellViewModel] = []
    private var collectionViewCellViewModels: [any Hashable] = []
    
    private let tableView = UITableView()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RMSearchResultsView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        isHidden = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RMLocationTableViewCell.self, forCellReuseIdentifier: RMLocationTableViewCell.id)
        tableView.isHidden = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharacterCollectionViewCell.self,
                                forCellWithReuseIdentifier: RMCharacterCollectionViewCell.id)
        collectionView.register(RMCharacterEpisodeCollectionViewCell.self,
                                forCellWithReuseIdentifier: RMCharacterEpisodeCollectionViewCell.id)
        collectionView.register(RMFooterLoadingCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: RMFooterLoadingCollectionReusableView.id)
        collectionView.isHidden = true
    }
    
    private func layout() {
        addSubviews(tableView, collectionView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 1),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func processViewModel() {
        guard let viewModel = viewModel else { return }
        
        switch viewModel.results {
        case .characters(let viewModels):
            self.collectionViewCellViewModels = viewModels
            setupCollectionView()
        case .episodes(let viewModels):
            self.collectionViewCellViewModels = viewModels
            setupCollectionView()
        case .locations(let viewModels):
            setupTableView(viewModels: viewModels)
        }
    }
    
    private func setupCollectionView() {
        tableView.isHidden = true
        collectionView.isHidden = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    private func setupTableView(viewModels: [RMLocationTableViewCellViewModel]) {
        tableView.isHidden = false
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.isHidden = true
        self.locationCellViewModels = viewModels
        tableView.reloadData()
    }
    
    public func configure(with viewModel: RMSearchResultViewModel) {
        self.viewModel = viewModel
    }
}

extension RMSearchResultsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RMLocationTableViewCell.id, for: indexPath) as? RMLocationTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: locationCellViewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.rmSearchResultsView(self, didTapLocationAt: indexPath.row)
    }
}

extension RMSearchResultsView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentViewModel = collectionViewCellViewModels[indexPath.row]
        
        if let characterVM = currentViewModel as? RMCharacterCollectionViewCellViewModel {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RMCharacterCollectionViewCell.id, for: indexPath) as? RMCharacterCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: characterVM)
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterEpisodeCollectionViewCell.id, for: indexPath) as? RMCharacterEpisodeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let episodeVM = currentViewModel as? RMCharacterEpisodeCollectionViewCellViewModel {
            cell.configure(with: episodeVM)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let currentViewModel = collectionViewCellViewModels[indexPath.row]
        
        if currentViewModel is RMCharacterCollectionViewCellViewModel {
            return CGSize(width: (collectionView.bounds.width-30)/2, height: ((collectionView.bounds.width-30)/2)*1.5)
        }
        
        return CGSize(width: collectionView.frame.width-16, height: 100)
    }
    
}

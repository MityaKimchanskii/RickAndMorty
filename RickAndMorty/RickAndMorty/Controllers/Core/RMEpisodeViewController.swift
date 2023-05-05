//
//  RMEpisodeViewController.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//

import UIKit


class RMEpisodeViewController: UIViewController {
    
    private let episodeListView = RMEpisodeListView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        addSearchButton()
    }
}

// MARK: - Extensions
extension RMEpisodeViewController {
    
    private func style() {
        view.backgroundColor = .systemBackground
        title = "Episode"
        
        episodeListView.translatesAutoresizingMaskIntoConstraints = false
        episodeListView.delegate = self
    }
    
    private func layout() {
        view.addSubview(episodeListView)
        
        NSLayoutConstraint.activate([
            episodeListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            episodeListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            episodeListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            episodeListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    @objc private func didTapSearch() {
        let vc = RMSearchViewController(configuration: .init(type: .episode))
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension RMEpisodeViewController: RMEpisodeListViewDelegate {
    func rmEpisodeListView(_ episodeListView: RMEpisodeListView, didSelectEpisode episode: RMEpisode) {
        let detailVC = RMEpisodeDetailViewController(url: URL(string: episode.url))
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//

import UIKit

final class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTabs()
    }
    
    private func setupTabs() {
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodeVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
//        characterVC.navigationItem.largeTitleDisplayMode = .automatic
//        locationVC.navigationItem.largeTitleDisplayMode = .automatic
//        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
//        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        characterVC.title = "Characters"
        locationVC.title = "Locations"
        episodeVC.title = "Episodes"
        settingsVC.title = "Settings"
        
        let characterNC = UINavigationController(rootViewController: characterVC)
        let locationNC = UINavigationController(rootViewController: locationVC)
        let episodeNC = UINavigationController(rootViewController: episodeVC)
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        
        for nc in [characterNC, locationNC, episodeNC, settingsNC] {
            nc.navigationBar.prefersLargeTitles = true
        }
        
        characterNC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        locationNC.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        episodeNC.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        settingsNC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        setViewControllers([
            characterNC,
            locationNC,
            episodeNC,
            settingsNC
        ], animated: true)
    }
}


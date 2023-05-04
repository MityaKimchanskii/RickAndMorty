//
//  RMSettingsViewController.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//

import UIKit
import SwiftUI

class RMSettingsViewController: UIViewController {
    
    private let settingsSwiftUIController = UIHostingController(
        rootView: RMSettingsView(
            viewModel: RMSettingsViewViewModel(cellViewModels: RMSettingsOption.allCases.compactMap({
                return RMSettingsCellVeiwModel(type: $0)
            }))
        )
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        addSwiftUIController()
        layout()
    }
}

extension RMSettingsViewController {
    
    private func style() {
        view.backgroundColor = .systemBackground
        settingsSwiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            settingsSwiftUIController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsSwiftUIController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            settingsSwiftUIController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            settingsSwiftUIController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addSwiftUIController() {
        addChild(settingsSwiftUIController)
        settingsSwiftUIController.didMove(toParent: self)
        view.addSubview(settingsSwiftUIController.view)
    }
}


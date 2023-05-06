//
//  RMSearchInputView.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/4/23.
//

import UIKit

protocol RMSearchInputViewDelegate: AnyObject {
    func rmSearchInputView(_ inputView: RMSearchInputView, didSelectOption option: RMSearchInputViewViewModel.DynamicOption)
}

final class RMSearchInputView: UIView {
    
    weak var delegate: RMSearchInputViewDelegate?
    
    private let searchBar = UISearchBar()
    
    private var viewModel: RMSearchInputViewViewModel? {
        didSet {
            guard let viewModel, viewModel.hasDynamicOptions else { return }
            let options = viewModel.options
            createOptionSelectionViews(options: options)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RMSearchInputView {
    private func style() {
        backgroundColor = .systemBackground
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"
    }
    
    private func layout() {
        addSubviews(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            searchBar.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: searchBar.trailingAnchor, multiplier: 1)
        ])
        
    }
    
    private func createOptionSelectionViews(options: [RMSearchInputViewViewModel.DynamicOption]) {
        let stackView = createOptionStackView()
        
        for x in 0..<options.count {
            let option = options[x]
            let button = UIButton()
            button.setTitle(option.rawValue, for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.backgroundColor = .systemGray5
            button.layer.cornerRadius = 5
            button.tag = x
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .primaryActionTriggered)
            
            stackView.addArrangedSubview(button)
        }
    }
    
    private func createOptionStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        return stackView
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        guard let options = viewModel?.options else { return }
        let tag = sender.tag
        let selected = options[tag]
        delegate?.rmSearchInputView(self, didSelectOption: selected)
    }
    
    public func configure(with viewModel: RMSearchInputViewViewModel) {
        searchBar.placeholder = viewModel.searchPlaceholderText
        self.viewModel = viewModel
    }
    
    public func presentKeyboard() {
        searchBar.becomeFirstResponder()
    }
}

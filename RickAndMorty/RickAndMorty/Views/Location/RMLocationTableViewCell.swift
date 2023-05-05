//
//  RMLocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/4/23.
//

import UIKit

final class RMLocationTableViewCell: UITableViewCell {

    static let id = "RMLocationTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: RMLocationTableViewCellViewModel) {
        
    }

}

//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            self.addSubview($0)
        })
    }
}

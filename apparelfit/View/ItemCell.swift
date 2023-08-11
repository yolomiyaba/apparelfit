//
//  ItemCell.swift
//  apparelfit
//
//  Created by Noah Miyabayashi on 2023/08/09.
//

import Foundation
import UIKit

class ItemCell: UICollectionViewCell {
    // MARK: -Properties
    // MARK: -Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: -Selectors
    // MARK: -Helpers
}

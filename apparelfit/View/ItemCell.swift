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
    var itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .green
        return iv
    }()
    var itemNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "PPPP"
        return lbl
    }()
    var fitButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "tshirt.fill")?.withTintColor(UIColor.lightGray), for: .normal)
        btn.titleLabel?.text = "op"
        btn.tintColor = .black
        btn.backgroundColor = .yellow
        btn.setDimensions(width: 30, height: 30)
        return btn
    }()
    var buyButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "tshirt.fill")?.withTintColor(UIColor.lightGray), for: .normal)
        btn.tintColor = .black
        btn.backgroundColor = .magenta
        btn.setDimensions(width: 30, height: 30)
        return btn
        
    }()
    private lazy var likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "heart.fill")?.withTintColor(UIColor.red), for: .normal)
        btn.tintColor = .black
        btn.backgroundColor = .systemCyan
        btn.setDimensions(width: 30, height: 30)
        btn.addTarget(self, action: #selector(handleLikeTapped), for: .touchUpInside)
        return btn
    }()
    // MARK: -Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(itemImageView)
        itemImageView.anchor(left: leftAnchor, paddingLeft: 16)
        itemImageView.centerY(inView: self)
        itemImageView.setDimensions(width: 80, height: 100)
        
        let actionStack = UIStackView(arrangedSubviews: [fitButton, buyButton, likeButton])
        actionStack.axis = .horizontal
        actionStack.spacing = 4
        addSubview(actionStack)
        actionStack.anchor(bottom: bottomAnchor, right: rightAnchor, paddingBottom: 16, paddingRight: 16)
        addSubview(itemNameLabel)
        itemNameLabel.centerY(inView: self)
        itemNameLabel.anchor(left: itemImageView.rightAnchor, paddingLeft: 16)
        
        let underlineView = UIView()
        underlineView.backgroundColor = .systemGroupedBackground
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: -Selectors
    @objc func handleLikeTapped() {
        print("DEBUG: Like tapped")
    }
    // MARK: -Helpers
}

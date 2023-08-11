//
//  ShopController.swift
//  apparelfit
//
//  Created by Noah Miyabayashi on 2023/07/26.
//

import Foundation
import UIKit
import Firebase

private let reuseIdentifier = "ItemCell"

class ShopController: UICollectionViewController {
    // MARK: - Properties
    let label: UILabel = {
        let label = UILabel()
        label.text = "ShopController"
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        //view.addSubview(label)
        //label.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 100, paddingLeft: 100)
    }
    // MARK: - API
    // MARK: - Selectors
    // MARK: - Helpers
    func configureUI() {
        
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        view.backgroundColor = .green
//        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
//        imageView.contentMode = .scaleAspectFit
//        imageView.setDimensions(width: 44, height: 44)
//        navigationItem.titleView = imageView
    }
}
    // MARK: -UICollectionViewDelegate/DataSource
extension ShopController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCell
        return cell
    }
}
    // MARK: -UICollectionViewFlowLayout
extension ShopController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}

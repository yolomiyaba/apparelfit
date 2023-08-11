//
//  ProfileController.swift
//  apparelfit
//
//  Created by Noah Miyabayashi on 2023/07/26.
//

import Foundation
import UIKit
import Firebase

class ProfileController: UIViewController {
    // MARK: - Properties
    let label: UILabel = {
        let label = UILabel()
        label.text = "ProfileController"
        return label
    }()
    let userImageView: UIImageView = {
       let iv = UIImageView()
        iv.backgroundColor = .magenta
        return iv
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(label)
        userImageView.setDimensions(width: view.frame.width, height: view.frame.height)
        view.addSubview(userImageView)
        label.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 100, paddingLeft: 100)
    }
    // MARK: - API
    // MARK: - Selectors
    // MARK: - Helpers
    
}


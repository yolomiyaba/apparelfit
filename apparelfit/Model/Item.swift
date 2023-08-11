//
//  Item.swift
//  apparelfit
//
//  Created by Noah Miyabayashi on 2023/08/11.
//

import Foundation

struct Item {
    var imageUrl: URL?
    let name: String
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        self.name = dictionary["itemName"] as? String ?? "undefined item"
        if let itemImageUrlString = dictionary["itemImageUrl"] as? String {
            guard let url = URL(string: itemImageUrlString) else {return}
            self.imageUrl = url
        }
    }
    
}

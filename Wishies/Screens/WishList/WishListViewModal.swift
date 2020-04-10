//
//  WishListViewModal.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 28/03/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import Foundation

class WishListViewModal{
    
    var wishes: [Wish]!
    
    init() {
        var wish1 = Wish(title: "first wish", body: "become rich!!")
        
        WishesDataStack.shared.insert(wish: &wish1)
        WishesDataStack.shared.insert(wish: &wish1)
        WishesDataStack.shared.insert(wish: &wish1)
        
        wishes = WishesDataStack.shared.getAllWishes()
    }
}

//
//  WishModalView.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 28/03/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import UIKit

enum WishViewMode {
    case edit
    case new
}

class WishViewModal{
    
    var wish: Wish?
    var viewMode: WishViewMode!
    
    var wishTitle: String? {
        return wish?.title
    }
    
    var wishBody: String? {
        return wish?.wishBody
    }
    
    var titlePlaceholder = "Enter wish title.."
//    var bodyPlaceholder = "So.. What is your wish? 🤔"
    
    init(wishId: String?) {
        if let wishId = wishId{
            wish = WishesDataStack.shared.getWish(by: wishId)
            viewMode = .edit
        } else {
            viewMode = .new
        }
        
    }
}

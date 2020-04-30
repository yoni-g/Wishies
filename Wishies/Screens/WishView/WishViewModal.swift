//
//  WishModalView.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 28/03/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import UIKit
//import Combine

enum WishViewMode {
    case edit
    case new
}

class WishViewModal{
    
    var wish: Wish?
    @Published var viewMode: WishViewMode!
    
    var wishTitle: String? {
        get {
            return wish?.title
        }
        set {
            wish?.title = newValue
        }
    }
    
    var wishBody: String? {
        get {
            return wish?.wishBody
        }
        set {
            wish?.wishBody = newValue
        }
    }
    
    var isWishFieldValid: Bool {
        return (wish?.title != nil && wish?.wishBody != nil)
    }
    
    var titlePlaceholder = "Enter wish title.."
//    var bodyPlaceholder = "So.. What is your wish? 🤔"
    
    init(wishId: String?) {
        if let wishId = wishId, let wish = WishesDataStack.shared.getWish(by: wishId){
            self.wish = wish
            viewMode = .edit
        } else {
            viewMode = .new
            wish = Wish()
        }
        
    }
}

extension WishViewModal{
    func saveAction()->OperationResult{
        guard var wish = wish else { return (success: false, reason: "") }
        // TODO: add validation
        if viewMode == .new{
            return WishesDataStack.shared.insert(wish: &wish)
        }
        return WishesDataStack.shared.update(updateWish: wish, withId: wish.id!)
    }
    
    func editAction(){
        // TODO:
        // add change VC state based on the edit btn click...
    }
    
    func deleteAction()->OperationResult{
        guard let wish = wish else { return (success: false, reason: "") }
        if viewMode == .edit{
            return WishesDataStack.shared.removeWish(by: wish.id!)
        }
        return (success: false, reason: "")
    }
}

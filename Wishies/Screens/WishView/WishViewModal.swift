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

class WishViewModal: NSObject{
    
    var wish: Wish?
    var viewMode: WishViewMode!
    
    var wishTitle: String? {
        return wish?.title
    }
    
    var wishBody: String? {
        return wish?.wishBody
    }
    
    var isWishFieldValid: Bool {
        return (wish?.title != nil && wish?.wishBody != nil)
    }
    
    var titlePlaceholder = "Enter wish title.."
//    var bodyPlaceholder = "So.. What is your wish? 🤔"
    
    init(wishId: String?) {
        if let wishId = wishId{
            wish = WishesDataStack.shared.getWish(by: wishId)
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
    
    func shareAction(){
        
    }
}

extension WishViewModal: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        wish?.wishBody = textView.text ?? ""
    }
}

extension WishViewModal: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        wish?.title = textField.text ?? ""
        return true
    }
}

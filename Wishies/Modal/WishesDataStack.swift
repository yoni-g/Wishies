//
//  WishesDataStack.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 10/04/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import Foundation
import UIKit


class WishesDataStack {
    
    typealias OperationResult = (success: Bool, reason: String?)
    
    static let shared = WishesDataStack()
    private init(){}
    
    private var wishes = [Wish]()
    
    func getAllWishes()->[Wish]{
        return wishes
    }
    
    func getWish(by id: String)->Wish?{
        return wishes.first { $0.id == id }
    }
    
    func removeWish(by id: String)->OperationResult{
        if let index = wishes.firstIndex(where: { $0.id == id }){
            wishes.remove(at: index)
            return (true, nil)
        }
        return (false, "Wish with id: \(id) not found!")
    }
    
    func insert(wish: inout Wish)->OperationResult{
        let id = generateId()
        wish.id = id
        wish.createdDate = Date()
        // TODO: check if alreadty exists or some other valdations
//        if wishes. {
//
//        }
        wishes.append(wish)
        return (true, nil)
    }
    
    func update(updateWish: inout Wish, withId id: String)->OperationResult{
        if var wish = getWish(by: id){
            wish.title = updateWish.title
            wish.wishBody = updateWish.wishBody
            return (true, nil)
        }
        return (false, "Wish with id: \(id) not found!")
    }
    
    private func generateId()->String{
        return String(Date.timeIntervalBetween1970AndReferenceDate)
    }
//    func
    
}

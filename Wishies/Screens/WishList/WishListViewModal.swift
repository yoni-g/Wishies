//
//  WishListViewModal.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 28/03/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import Foundation
import UIKit

class WishListViewModal{
    
    var wishes: [Wish]!
    var emptyTableView: UIView!
    
    init(){
        
        wishes = WishesDataStack.shared.getAllWishes()
//        emptyTableView = ViewUtils.createEmptyTableView()
    }
    
}

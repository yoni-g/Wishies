//
//  Wish.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 28/03/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import Foundation

struct Wish {
    var title: String
    var wishBody: String
    var createdDate: Date?
    var id: String?
    
    init(title: String, body: String) {
        self.title = title
        self.wishBody = body
    }
//    var title: String
}

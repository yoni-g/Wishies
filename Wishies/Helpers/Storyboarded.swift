//
//  Storyboarded.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 13/04/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate()->Self
}

extension Storyboarded where Self: UIViewController{
    static func instantiate()->Self{
        let vcId = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: vcId) as! Self
    }
    
}

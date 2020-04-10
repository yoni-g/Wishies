//
//  WishListTableViewDataSource.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 10/04/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import UIKit

class WishListTableView: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var wishes: [Wish]!
    
    init(wishes: [Wish]) {
        self.wishes = wishes
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "wishCell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = wishes[indexPath.row].title
        cell.detailTextLabel?.text = wishes[indexPath.row].wishBody
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(wishes[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delAction = UIContextualAction(style: .destructive, title: "Delete") {_,_,complete in
            print("delete")
            complete(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "") {_,_,complete in
            print("share")
            complete(true)
            
        }
        shareAction.image = UIImage(systemName: "square.and.arrow.up")

        return UISwipeActionsConfiguration(actions: [delAction, shareAction])
    }
    
}

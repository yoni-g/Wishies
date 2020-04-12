//
//  WishListViewController.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 20/03/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    var viewModal: WishListViewModal!
    @IBOutlet var tableView: UITableView!
    var tableViewDelegate: WishListTableView!
    
    override func viewDidLoad() {
        
        viewModal = WishListViewModal()
        
        tableViewDelegate = WishListTableView(wishes: viewModal.wishes)
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDelegate
        tableViewDelegate.navigateToWish = displayWishView
        
        super.viewDidLoad()
    }
    
    func displayWishView(with wishId: String){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let wishVC = storyboard.instantiateViewController(identifier: "WishViewController")
        
        self.navigationController?.pushViewController(wishVC, animated: true)
    }
    

}


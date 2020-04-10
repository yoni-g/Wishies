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
//    var tableView: UITableView!
    
    override func viewDidLoad() {
        viewModal = WishListViewModal()
        tableViewDelegate = WishListTableView(wishes: viewModal.wishes)
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDelegate
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

}


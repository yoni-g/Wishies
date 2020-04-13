//
//  WishListViewController.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 20/03/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController, Storyboarded {
    
    var viewModal: WishListViewModal!
    @IBOutlet var tableView: UITableView!
    var tableViewDelegate: WishListTableView!
    
    override func viewDidLoad() {
        initViewCtrl()
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initViewCtrl()
        super.viewDidAppear(animated)
    }
    
    func initViewCtrl(){
        viewModal = WishListViewModal()
        
        tableViewDelegate = WishListTableView(wishes: viewModal.wishes)
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDelegate
        tableViewDelegate.navigateToWish = displayWishView
    }
    
    func displayWishView(with wishId: String){
        MainCoordinator.shared.show(view: .wishView(wishId))
    }
    
    @IBAction func settingBarButtonAction(_ sender: Any) {
        MainCoordinator.shared.show(view: .settings)
    }
    
    @IBAction func createBarButtonAction(_ sender: Any) {
        MainCoordinator.shared.show(view: .wishView(nil))
    }
    

}


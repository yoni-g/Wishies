//
//  MainCoordinator.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 13/04/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator{
    
    var navigationController: UINavigationController?
    static var shared = MainCoordinator()
    
    private init() {}
    
    func start(){
        showHomwView(animated: false)
    }
    // set the nav bar
    func setNavControler(_ navCtrl: UINavigationController)->Self{
        self.navigationController = navCtrl
        return self
    }
    
    func show(view: AppView){
        switch view {
            case .wishList:
                showHomwView(animated: true)
            case .wishView(let wishId):
                let vc = WishViewController.instantiate()
                vc.wishId = wishId
                navigationController?.pushViewController(vc, animated: true)
            case .settings:
                let vc = SettingsViewController.instantiate()
                navigationController?.pushViewController(vc, animated: true)
            default:
                break
        }
    }
    
    internal func showHomwView(animated: Bool){
        let vc = WishListViewController.instantiate()
        navigationController?.pushViewController(vc, animated: animated)
    }
    
}

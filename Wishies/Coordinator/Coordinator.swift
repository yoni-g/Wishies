//
//  Coordinator.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 13/04/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import UIKit

// apps' views -> we can also split into separate enums for each child coordinator
enum AppView {
    case settings
    case wishList
    case wishView(_ wishId: String?)
    case login
}

protocol Coordinator {
//    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get set }
    // config funcs
    func setNavControler(_ navCtrl: UINavigationController)->Self
    func start()
    // display funcs
    func show(view: AppView)
    func showHomwView(animated: Bool)
}

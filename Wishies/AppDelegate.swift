//
//  AppDelegate.swift
//  Wishies
//
//  Created by Yonathan Goriachnick on 20/03/2020.
//  Copyright © 2020 YGApps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

//    lazy var per

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // add some initial data
        var wish1 = Wish(title: "first wish", body: "become rich!!")
        var wish2 = Wish(title: "2nd wish", body: "become famous!!")
        var wish3 = Wish(title: "3rd wish", body: "become a god!!")
        _ = WishesDataStack.shared.insert(wish: &wish1)
        _ = WishesDataStack.shared.insert(wish: &wish2)
        _ = WishesDataStack.shared.insert(wish: &wish3)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


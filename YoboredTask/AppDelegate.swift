//
//  AppDelegate.swift
//  YoboredTask
//
//  Created by Jeel Shah on 18/06/20.
//  Copyright © 2020 Jeel Shah. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        window?.rootViewController = HomeViewController(collectionViewLayout: layout)
        
        return true
    }

}


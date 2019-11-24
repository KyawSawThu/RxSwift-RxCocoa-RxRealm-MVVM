//
//  AppDelegate.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit
import LGSideMenuController
import RealmSwift
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
//    func switchRootViewController() {
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let sideMenu = storyboard.instantiateViewController(withIdentifier: "LGSideMenuController") as! LGSideMenuController
//        self.window?.rootViewController = sideMenu
//        self.window?.makeKeyAndVisible()
//    }
//
//    func switchBack() {
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let nav = storyboard.instantiateViewController(withIdentifier: "LogInViewController")
//        self.window?.makeKeyAndVisible()
//        self.window?.rootViewController = nav
//    }
    

//    func navigateToHome() {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "LGSideMenuController") as! LGSideMenuController
//        self.window?.makeKeyAndVisible()
//        self.window?.rootViewController = vc
//    }
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
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


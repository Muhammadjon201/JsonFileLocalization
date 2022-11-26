//
//  AppDelegate.swift
//  JsonLevel
//
//  Created by ericzero on 11/16/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        
        let vc = CountryListViewController()
        let nc = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
        setNavBar()
        return true
    }
    
    func setNavBar() {
           
               let color = UIColor(red: 233/255, green: 119/255, blue: 119/255, alpha: 1)
               let appearance = UINavigationBarAppearance()
               appearance.configureWithOpaqueBackground()
               appearance.backgroundColor = color
               UINavigationBar.appearance().standardAppearance = appearance
               UINavigationBar.appearance().scrollEdgeAppearance = appearance
           }

   
}


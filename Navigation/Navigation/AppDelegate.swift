//
//  AppDelegate.swift
//  Navigation
//
//  Created by Дмитрий Никоноров on 01.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let profile = ProfileViewController()
        profile.title = "Ваш профиль"
        let tabBarProfile = UITabBarItem()
        tabBarProfile.image = .init(systemName: "person.fill")
        tabBarProfile.title = "Профиль"
        profile.tabBarItem = tabBarProfile

        
        let feed = FeedViewController()
       
        
        
        let feedNavagation = UINavigationController(rootViewController: feed)
        let profileNavigation = UINavigationController(rootViewController: profile)
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [feedNavagation, profileNavigation]
        tabbarController.selectedIndex = 0
        
        
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        return true
    }
}


import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
    
        let profile = ProfileViewController()
        profile.loadViewIfNeeded()

        let feed = FeedViewController()
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = .systemGray6
        
        let profileNavigationController = UINavigationController(rootViewController: profile)
        profileNavigationController.navigationBar.scrollEdgeAppearance = navigationAppearance
        
        
        let feedNavigationController =
            UINavigationController(rootViewController: feed)
        feedNavigationController.navigationBar.scrollEdgeAppearance = navigationAppearance
    
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .systemGray6
        tabBarController.tabBar.unselectedItemTintColor = .systemGray
        tabBarController.tabBar.tintColor = .systemBlue
    
        

        tabBarController.setViewControllers([feedNavigationController, profileNavigationController ], animated: true)
        tabBarController.selectedIndex = 0
        
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        
        
        return true
    }

}


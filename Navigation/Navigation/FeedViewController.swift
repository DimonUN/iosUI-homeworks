//
//  FeedViewController.swift
//  Navigation
//
//  Created by Дмитрий Никоноров on 01.12.2021.
//

import UIKit

class FeedViewController: UIViewController {

    struct Post {
        let title: String
    }
    
    var post = Post(title: "Первый пост")
    
    var tabBarFeed: UITabBarItem = {
        let tabBarFeed = UITabBarItem()
        tabBarFeed.image = .init(systemName: "house.fill")
        tabBarFeed.title = "Лента"
        return tabBarFeed
    }()
    
    
    var button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Пост", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.title = "Ваша лента"
        self.tabBarItem = tabBarFeed
        button.center = self.view.center
        
        view.addSubview(button)
    }


    
    @objc func buttonAction(sender: UIButton) {
        let vc = PostViewController()
        vc.firstPost = self.post.title
        self.navigationController?.pushViewController(vc, animated: true)
     }
        
}

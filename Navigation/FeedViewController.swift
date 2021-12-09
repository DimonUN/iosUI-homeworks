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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addButton()
    }

    fileprivate func addButton() {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.center = self.view.center
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Пост", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton) {
        let postVC = PostViewController()
        postVC.firstPost = self.post.title
        navigationController?.pushViewController(postVC, animated: true)
     }
        
}

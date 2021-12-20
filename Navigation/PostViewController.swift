//
//  PostViewController.swift
//  Navigation
//
//  Created by Дмитрий Никоноров on 01.12.2021.
//

import UIKit

class PostViewController: UIViewController {

    var firstPost: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        self.title = firstPost
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(openInfoVC))
    }
    
    
    @objc func openInfoVC(sender: UIBarButtonItem) {
        let modalInfoVC = InfoViewController()
        present(modalInfoVC, animated: true, completion: nil)
    } 
}

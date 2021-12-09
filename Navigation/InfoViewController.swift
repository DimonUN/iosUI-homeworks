//
//  InfoViewController.swift
//  Navigation
//
//  Created by Дмитрий Никоноров on 05.12.2021.
//

import UIKit

class InfoViewController: UIViewController {
    var someValue = 12

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addButton()
    }
    
    
    fileprivate func addButton() {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.center = view.center
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Alert", for: .normal)
        button.addTarget(self, action: #selector(donePressed), for: .touchUpInside)
        view.addSubview(button)
    }
    
    
    @objc func donePressed(sender: UIButton) {
        let alert = UIAlertController(
            title: "Attention", message: "Something wrong", preferredStyle: .alert)
        
        let okAction = UIAlertAction(
            title: "Ok", style: .default, handler: {(okAction) in print("Ok was pressed")})
        
        let cancelAction = UIAlertAction(
            title: "Cancel", style: .destructive, handler: {(cancelAction) in print("Cancel was pressed")})
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
       
        present(alert, animated: true, completion: nil)
        
    }
}
   

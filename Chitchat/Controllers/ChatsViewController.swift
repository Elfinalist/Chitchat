//
//  ViewController.swift
//  Chitchat
//
//  Created by ELVIS WANJOHI on 29/09/2021.
//

import UIKit
import Firebase

class ChatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
        validateAuth()
        
    }
    
    private func validateAuth() {
        if Firebase.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
    

}


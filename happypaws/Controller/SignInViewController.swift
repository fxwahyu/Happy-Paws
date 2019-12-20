//
//  SignInViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 26/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavbar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.barTintColor = nil
    }
    
    func setupNavbar(){
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = false
        nav?.setBackgroundImage(UIImage(), for: .default)
        nav?.shadowImage = UIImage()
        nav?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func signIn(_ sender: Any) {
        // if email and password right
        
        //if login user
//        if email.text == "user"{
//            Paws.shared.loggedin = "User"
//            UserDefaults.standard.set(Paws.shared.loggedin, forKey: "loggedin")
//            UserDefaults.standard.set("User", forKey: "loggedin")
//           present(UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "User_sb") as UIViewController, animated: false, completion: nil)
//        }
        
        //if login admin
//        if email.text == "admin" {
//            Paws.shared.loggedin = "Admin"
//            UserDefaults.standard.set(Paws.shared.loggedin, forKey: "loggedin")
//            UserDefaults.standard.set("Admin", forKey: "loggedin")
//            present(UIStoryboard(name: "Admin", bundle: nil).instantiateViewController(withIdentifier: "Admin_sb") as UIViewController, animated: false, completion: nil)
//        }
    }
    

}

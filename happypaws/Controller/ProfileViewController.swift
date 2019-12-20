//
//  ProfileViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 26/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 0.3902376592, blue: 0.4975451827, alpha: 1)
    }
    
    @objc func save(){
        //if password changed, go to database
        
        present(UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "User_sb") as UIViewController, animated: false, completion: nil)
    }
    
    @IBAction func signOut(_ sender: Any) {
        Paws.shared.loggedin = "User"
        UserDefaults.standard.set(Paws.shared.loggedin, forKey: "loggedin")
        present(UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "User_sb") as UIViewController, animated: false, completion: nil)
    }
    

}

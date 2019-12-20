//
//  AdminSignOutViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 26/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class AdminSignOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOut(_ sender: Any) {
        Paws.shared.loggedin = "User"
        UserDefaults.standard.set(Paws.shared.loggedin, forKey: "loggedin")
        present(UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "User_sb") as UIViewController, animated: false, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

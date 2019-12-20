//
//  ViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 24/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        moveStoryboard()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moveStoryboard()
    }
    
    
    func moveStoryboard(){
        let name = Paws.shared.loggedin
        if name == "User"{
            present(UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "User_sb") as UIViewController, animated: false, completion: nil)
        } else {
            present(UIStoryboard(name: "Admin", bundle: nil).instantiateViewController(withIdentifier: "Admin_sb") as UIViewController, animated: false, completion: nil)
        }
    }

}


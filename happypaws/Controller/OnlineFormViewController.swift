//
//  OnlineFormViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 19/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class OnlineFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    @IBAction func adoptButton(_ sender: Any) {
        let alert = UIAlertController(title: "Congratulations!", message: "You have adopted Brownie. Please take care of him :)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "User_sb") as! UIViewController
            self.present(viewController, animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true)
    }
    
    

}

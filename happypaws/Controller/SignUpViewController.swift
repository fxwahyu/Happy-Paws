//
//  SignUpViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 31/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textF_address: UITextField!
    @IBOutlet weak var textF_occupation: UITextField!
    @IBOutlet weak var textF_phone: UITextField!
    @IBOutlet weak var textF_email: UITextField!
    @IBOutlet weak var textF_password: UITextField!
    @IBOutlet weak var textF_confPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavbar()
        setupTextField()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
//
//    @objc func keyboardWillChange(notification: Notification){
//        guard let keyboardRect = (notification.userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
//            return
//        }
//        view.frame.origin.y = -300
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textF_address{
            self.textF_address.resignFirstResponder()
            self.textF_occupation.becomeFirstResponder()
        }
        if textField == textF_occupation{
            self.textF_occupation.resignFirstResponder()
            self.textF_phone.becomeFirstResponder()
        }
        if textField == textF_phone{
            self.textF_phone.resignFirstResponder()
            self.textF_email.becomeFirstResponder()
        }
        if textField == textF_email{
            self.textF_email.resignFirstResponder()
            self.textF_password.becomeFirstResponder()
        }
        if textField == textF_password{
            self.textF_password.resignFirstResponder()
            self.textF_confPassword.becomeFirstResponder()
        }
        if textField == textF_confPassword{
            self.view.endEditing(true)
        }
        
        
        return true
    }
    
    func setupTextField(){
        textF_address.borderStyle = UITextField.BorderStyle.none
        textF_address.layer.cornerRadius = 10
        textF_address.clipsToBounds = true
        textF_occupation.borderStyle = UITextField.BorderStyle.none
        textF_occupation.layer.cornerRadius = 10
        textF_occupation.clipsToBounds = true
        textF_phone.borderStyle = UITextField.BorderStyle.none
        textF_phone.layer.cornerRadius = 10
        textF_phone.clipsToBounds = true
        textF_email.borderStyle = UITextField.BorderStyle.none
        textF_email.layer.cornerRadius = 10
        textF_email.clipsToBounds = true
        textF_password.borderStyle = UITextField.BorderStyle.none
        textF_password.layer.cornerRadius = 10
        textF_password.clipsToBounds = true
        textF_confPassword.borderStyle = UITextField.BorderStyle.none
        textF_confPassword.layer.cornerRadius = 10
        textF_confPassword.clipsToBounds = true
    }
    
    func setupNavbar(){
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = false
        nav?.setBackgroundImage(UIImage(), for: .default)
        nav?.shadowImage = UIImage()
        nav?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //        nav?.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    
    
    
}

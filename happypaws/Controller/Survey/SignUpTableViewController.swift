//
//  SignUpTableViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 01/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class SignUpTableViewController: UITableViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var textF_address: UITextField!
    @IBOutlet weak var textF_occupation: UITextField!
    @IBOutlet weak var textF_phone: UITextField!
    @IBOutlet weak var textF_email: UITextField!
    @IBOutlet weak var textF_password: UITextField!
    @IBOutlet weak var textF_confPassword: UITextField!
    var fotoKtp: UIImage?
    
    @IBOutlet weak var uploadImage: UIImageView!
    @IBOutlet weak var btnSignup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
        setupNavbar()
        setupTextField()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        textF_password.isSecureTextEntry = true
        textF_confPassword.isSecureTextEntry = true
        textF_address.becomeFirstResponder()
//        signup.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
    }
    
    
    @IBAction func openCameraButton(sender: AnyObject) {
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
//            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
//        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
        fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        fotoKtp = selectedImage
        
        // Dismiss the picker.
        uploadImage.image = UIImage(named: "centang")
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
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
    }

    private func addButton() {
        
        btnSignup.setBackgroundImage(UIImage(named: "button"), for: .normal)
        btnSignup.setTitle("Sign Up", for: .normal)
//        self.view.addSubview(signup)
        // set position
        btnSignup.translatesAutoresizingMaskIntoConstraints = false
        btnSignup.leftAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        btnSignup.rightAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        btnSignup.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        btnSignup.heightAnchor.constraint(equalToConstant: 49).isActive = true // specify the height of the view
        
    }
    
    @IBAction func signup(_ sender: UIButton) {
        if textF_email.text == "" || textF_phone.text == "" || textF_address.text == "" || textF_password.text == "" || textF_confPassword.text == "" || textF_occupation.text == ""{
            alert("Field can't be empty")
        } else{
            if textF_password.text != textF_confPassword.text{
                alert("Password doesn't match")
            } else{
                let viewController = storyboard?.instantiateViewController(withIdentifier: "survey") as! SurveyViewController
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func alert(_ m: String){
        let alert = UIAlertController(title: "", message: m, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

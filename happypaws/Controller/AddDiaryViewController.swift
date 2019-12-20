//
//  AddDiaryViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 15/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class AddDiaryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate{

    @IBOutlet weak var views: UIView!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var postdate: UILabel!
    var diary: [Paws.diary] = Paws.shared.diaries
    var gambar: UIImage?
    let placeholder: String = "Write a story..."
    override func viewDidLoad() {
        super.viewDidLoad()
        
        views.layer.cornerRadius = 6
        views.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        content.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        content.text = placeholder
        content.becomeFirstResponder()
        getDate()
        // Do any additional setup after loading the view.
    }
    
    func getDate(){
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        postdate.text = "\(getMonth(month)) \(getDay(day)) \(String(year))"
        print(day)
        print(month)
        print(year)
    }
    
    func getMonth(_ month: Int)->String{
        if month == 1{
            return "January"
        } else if month == 2{
            return "February"
        } else if month == 3{
            return "March"
        } else if month == 4{
            return "April"
        } else if month == 5{
            return "May"
        } else if month == 6{
            return "June"
        } else if month == 7{
            return "July"
        } else if month == 8{
            return "August"
        } else if month == 9{
            return "September"
        } else if month == 10{
            return "October"
        } else if month == 11{
            return "November"
        } else if month == 12{
            return "December"
        }
        return "Error"
    }
    
    func getDay(_ day: Int)->String{
        if day == 1{
            return "1st"
        } else if day == 2{
            return "2nd"
        } else if day == 3{
            return "3rd"
        } else {
            return "\(day)th"
        }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    func setupNavBar(){
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(share))
        nav?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @objc func share(){
        if content.text! == ""{
            alert()
        } else {
            diary.append(Paws.diary(date: postdate.text!, content: content.text!, photo: Paws.shared.chosenDog?.photo[0]))
            Paws.shared.diaries = diary
            let alert = UIAlertController(title: "Success", message: "Thank you for sharing :)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                let viewController = self.storyboard?.instantiateViewController(withIdentifier: "User_sb") as! UIViewController
                self.present(viewController, animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true)
        }
        
    }
    
    func alert(){
        let alert = UIAlertController(title: "", message: "Field can't be empty", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func takeFoto(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            //            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        gambar = selectedImage
        addButton.setImage(gambar, for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if content.text == placeholder{
            content.text = ""
            content.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if content.text == ""{
            content.text = placeholder
            content.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }
    }
}

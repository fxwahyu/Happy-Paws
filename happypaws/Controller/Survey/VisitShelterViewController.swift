//
//  VisitShelterViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 09/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class VisitShelterViewController: UIViewController, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource, UINavigationControllerDelegate {
    
    @IBOutlet weak var chooseDate: UITextField!
    @IBOutlet weak var chooseTime: UITextField!
    var day: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var time: [String] = [
        "09.00 - 10.00",
        "10.00 - 11.00",
        "11.00 - 12.00",
        "12.00 - 13.00",
        "13.00 - 14.00",
        "14.00 - 15.00",
        "15.00 - 16.00",
        "16.00 - 17.00",
        "17.00 - 18.00",
        "18.00 - 19.00",
        "19.00 - 20.00"
    ]
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        chooseDate.inputView = picker
        chooseTime.isUserInteractionEnabled = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return 7
        }
        return 13
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow
        row: Int, forComponent component: Int) -> String! {
        
        if component == 0 {
            return self.day[row]
        }
        return self.time[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var chosenDate: String = day[pickerView.selectedRow(inComponent: 0)]
        var chosenTime: String = time[pickerView.selectedRow(inComponent: 1)]
        
        chooseDate.text = chosenDate
        chooseTime.text = chosenTime
    }
    
    @IBAction func doneButton(_ sender: Any) {
        if chooseDate.text == ""{
            alert()
        } else{
            let alert = UIAlertController(title: "It's all set!", message: "We will check your submission within 1-2 days", preferredStyle: .alert)
            
            Paws.shared.diaryStatus = 4
            
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
    
}

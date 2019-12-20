//
//  SurveyViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 05/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    var counter: Int = 1
    var photoIndicator: Int?
    let picker1 = UIPickerView()
    let picker3_1 = UIPickerView()
    let picker3_2 = UIPickerView()
    let picker7 = UIPickerView()
    let picker8 = UIPickerView()
    var optionsNumber: Int?
    var fotoPagar_: UIImage?
    var fotoBalkon_: UIImage?
    var fotoTempatAnjing_: UIImage?
    var fotoTaman_: UIImage?
    
    var _answer1: String = ""
    var _answer2: String = ""
    var _answer3: [String] = ["", ""]
    var _answer4: String = ""
    var _answer5: String = ""
    var _answer6: String = ""
    var _answer7: String = ""
    var _answer8: [String] = ["", ""]
//    var _answer9: [UIImage]?
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var answer2: UITextField!
    @IBOutlet weak var answer3: UITextField!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var doneButton_: UIButton!
    @IBOutlet weak var number: UIImageView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var question2: UILabel!
    @IBOutlet weak var line_question1: UIView!
    @IBOutlet weak var line_question2: UIView!
    @IBOutlet weak var line_question3: UIView!
    @IBOutlet weak var fotoPagar: UIButton!
    @IBOutlet weak var fotoBalkon: UIButton!
    @IBOutlet weak var fotoTempatAnjing: UIButton!
    @IBOutlet weak var fotoTaman: UIButton!
    @IBOutlet weak var labelfoto1: UILabel!
    @IBOutlet weak var labelfoto2: UILabel!
    @IBOutlet weak var labelfoto3: UILabel!
    @IBOutlet weak var labelfoto4: UILabel!
    @IBOutlet weak var skip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Paws.shared.survey != nil{
            inputAnswer()
        }
        
        picker1.delegate = self
        picker1.dataSource = self
        picker3_1.delegate = self
        picker3_1.dataSource = self
        picker3_2.delegate = self
        picker3_2.dataSource = self
        picker7.delegate = self
        picker7.dataSource = self
        picker8.delegate = self
        picker8.dataSource = self
        
        answer.delegate = self
        answer2.delegate = self
        answer3.delegate = self
        
        picker1.tag = 1
        picker3_1.tag = 2
        picker3_2.tag = 3
        picker7.tag = 4
        picker8.tag = 5
        
        pageControl.numberOfPages = 9
        pageControl.currentPage = counter-1
        
        setupNavbar()
        hideAndShow()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        fotoPagar.contentMode = UIView.ContentMode.scaleToFill
        fotoPagar.clipsToBounds = true
        fotoBalkon.contentMode = UIView.ContentMode.scaleToFill
        fotoBalkon.clipsToBounds = true
        fotoTaman.contentMode = UIView.ContentMode.scaleToFill
        fotoTaman.clipsToBounds = true
        fotoTempatAnjing.contentMode = UIView.ContentMode.scaleToFill
        fotoTempatAnjing.clipsToBounds = true
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .right {
            if counter > 1{
                changeNumber("back")
            }
        }
        else if gesture.direction == .left {
            if counter < 9{
                changeNumber("next")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(counter)
        hideAll()
        hideAndShow()
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    func setupNavbar(){
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = false
        nav?.setBackgroundImage(UIImage(), for: .default)
        nav?.shadowImage = UIImage()
        nav?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func inputAnswer(){
        var survey: Paws.surveyAnswer = Paws.shared.survey!
        _answer3[0] = survey._answer3[0]
        _answer3[1] = survey._answer3[1]
        _answer7 = survey._answer7
        _answer8[0] = survey._answer8[0]
        _answer8[1] = survey._answer8[1]
    }
    
    func setupFont(_ text: String, _ questionNumber: Int){
        let paragraphStyle = NSMutableParagraphStyle()
        //line height size
        paragraphStyle.lineHeightMultiple = 1.5
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        if questionNumber == 1{
            question.attributedText = attrString
        } else{
            question2.attributedText = attrString
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return Paws.shared.options1.count
        } else if pickerView.tag == 2{
            return Paws.shared.options2.count
        } else if pickerView.tag == 3{
            return Paws.shared.options3.count
        } else if pickerView.tag == 4{
            return Paws.shared.options4.count
        } else if pickerView.tag == 5{
            return Paws.shared.options5.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return Paws.shared.options1[row]
        } else if pickerView.tag == 2{
            return Paws.shared.options2[row]
        } else if pickerView.tag == 3{
            return Paws.shared.options3[row]
        } else if pickerView.tag == 4{
            return Paws.shared.options4[row]
        } else if pickerView.tag == 5{
            return Paws.shared.options5[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            answer.text = Paws.shared.options1[row]
        } else if pickerView.tag == 2{
            answer.text = Paws.shared.options2[row]
        } else if pickerView.tag == 3{
            answer3.text = Paws.shared.options3[row]
        } else if pickerView.tag == 4{
            answer.text = Paws.shared.options4[row]
        } else if pickerView.tag == 5{
            answer.text = Paws.shared.options5[row]
        }
        
        self.view.endEditing(true)
    }
    
    func hideAll(){
        pageControl.currentPage = counter-1
        question2.isHidden = true
        answer.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        line_question1.isHidden = true
        line_question2.isHidden = true
        line_question3.isHidden = true
        leftButton.isHidden = true
        rightButton.isHidden = true
        fotoPagar.isHidden = true
        fotoBalkon.isHidden = true
        fotoTempatAnjing.isHidden = true
        fotoTaman.isHidden = true
        labelfoto1.isHidden = true
        labelfoto2.isHidden = true
        labelfoto3.isHidden = true
        labelfoto4.isHidden = true
        doneButton_.isHidden = true
        skip.isHidden = true
        answer.text = ""
        answer2.text = ""
        answer3.text = ""
    }
    
    func hideAndShow(){
        var questionlist: [String] = Paws.shared.questions
        if counter == 1{
            number.image = UIImage(named: "survey1")
            question.text = questionlist[0]
            setupFont(questionlist[0], 1)
            rightButton.isHidden = false
            rightButton.setImage(UIImage(named: "yes icon"), for: .normal)
            leftButton.isHidden = false
            leftButton.setImage(UIImage(named: "no icon"), for: .normal)
            answer.isHidden = true
            line_question1.isHidden = true
        } else if counter == 2{
            number.image = UIImage(named: "survey2")
            question.text = questionlist[1]
            setupFont(questionlist[1], 1)
            rightButton.isHidden = false
            leftButton.isHidden = false
            rightButton.setImage(UIImage(named: "yes icon"), for: .normal)
            leftButton.setImage(UIImage(named: "no icon"), for: .normal)
            leftButton.isHidden = false
        } else if counter == 3{
            number.image = UIImage(named: "survey3")
            question.text = questionlist[2]
            setupFont(questionlist[2], 1)
            rightButton.isHidden = false
            rightButton.setImage(UIImage(named: "next icon"), for: .normal)
            answer.isHidden = false
            answer.placeholder = "Age"
            line_question1.isHidden = false
            answer3.placeholder = "Gender"
            answer3.isHidden = false
            line_question3.isHidden = false
            answer.inputView = picker3_1
            answer3.inputView = picker3_2
            skip.isHidden = false
            if _answer3[0] != ""{
                answer.placeholder = _answer3[0]
                answer.text = _answer3[0]
                print(_answer3[0])
            }
            if _answer3[1] != ""{
                answer3.placeholder = _answer3[1]
                answer3.text = _answer3[1]
                print(_answer3[1])
            }
        } else if counter == 4{
            number.image = UIImage(named: "survey4")
            question.text = questionlist[3]
            setupFont(questionlist[3], 1)
            rightButton.isHidden = false
            rightButton.setImage(UIImage(named: "yes icon"), for: .normal)
            leftButton.setImage(UIImage(named: "no icon"), for: .normal)
            leftButton.isHidden = false
        } else if counter == 5{
            number.image = UIImage(named: "survey5")
            question.text = questionlist[4]
            setupFont(questionlist[4], 1)
            rightButton.isHidden = false
            rightButton.setImage(UIImage(named: "yes icon"), for: .normal)
            leftButton.setImage(UIImage(named: "no icon"), for: .normal)
            leftButton.isHidden = false
        } else if counter == 6{
            number.image = UIImage(named: "survey6")
            question.text = questionlist[5]
            setupFont(questionlist[5], 1)
            rightButton.isHidden = false
            rightButton.setImage(UIImage(named: "yes icon"), for: .normal)
            leftButton.setImage(UIImage(named: "no icon"), for: .normal)
            leftButton.isHidden = false
        } else if counter == 7{
            number.image = UIImage(named: "survey7")
            question.text = questionlist[6]
            setupFont(questionlist[6], 1)
            rightButton.isHidden = false
            rightButton.setImage(UIImage(named: "next icon"), for: .normal)
            answer.placeholder = "Required"
            answer.isHidden = false
            line_question1.isHidden = false
            answer.inputView = picker7
            if _answer7 != ""{
                answer.placeholder = _answer7
                answer.text = _answer7
                print(_answer7)
            }
        } else if counter == 8{
            number.image = UIImage(named: "survey8")
            question.text = questionlist[7]
            setupFont(questionlist[7], 1)
            question2.text = questionlist[8]
            setupFont(questionlist[8], 2)
            question2.isHidden = false
            answer.isHidden = false
            answer.placeholder = "Required"
            line_question1.isHidden = false
            answer2.isHidden = false
            line_question2.isHidden = false
            rightButton.isHidden = false
            rightButton.setImage(UIImage(named: "next icon"), for: .normal)
            answer.inputView = picker8
            answer2.inputView = nil
            if _answer8[0] != ""{
                answer.placeholder = _answer8[0]
                answer.text = _answer8[0]
                print(_answer8[0])
            }
            if _answer8[1] != ""{
                answer2.placeholder = _answer8[1]
                answer2.text = _answer8[1]
                print(_answer8[1])
            }
        } else if counter == 9{
            number.image = UIImage(named: "survey9")
            question.text = questionlist[9]
            setupFont(questionlist[9], 1)
            doneButton_.isHidden = false
            fotoPagar.isHidden = false
            fotoBalkon.isHidden = false
            fotoTempatAnjing.isHidden = false
            fotoTaman.isHidden = false
            labelfoto1.isHidden = false
            labelfoto2.isHidden = false
            labelfoto3.isHidden = false
            labelfoto4.isHidden = false
        }
    }
    
    func changeNumber(_ change: String){
        if change == "back"{
            counter -= 1
            hideAll()
            hideAndShow()
            
        } else if change == "next"{
            if counter == 9{
            } else{
                counter+=1
                hideAll()
                hideAndShow()
            }
        }
        print("after click : \(counter)")
    }
    
    @IBAction func left(_ sender: Any) {
        var valid = true
        if counter == 1{
            _answer1 = "No"
        } else if counter == 2{
            _answer2 = "No"
        } else if counter == 4{
            _answer4 = "No"
        } else if counter == 5{
            _answer5 = "No"
        } else if counter == 6{
            _answer6 = "No"
        }
        changeNumber("next")
    }
    
    @IBAction func right(_ sender: Any) {
        var valid = true
        if counter == 1{
            _answer1 = "Yes"
        } else if counter == 2{
            _answer2 = "Yes"
        } else if counter == 3{
            if answer.text! == ""{
            } else{
                _answer3[0] = answer.text!
            }
            
            if answer3.text! == ""{
            } else {
                _answer3[1] = answer3.text!
            }
        } else if counter == 4{
            _answer4 = "Yes"
        } else if counter == 5{
            _answer5 = "Yes"
        } else if counter == 6{
            _answer6 = "Yes"
        } else if counter == 7{
            if answer.text! == "" {
                valid = false
                alert()
            } else{
                _answer7 = answer.text!
            }
        } else if counter == 8{
            if answer.text! == "" {
                valid = false
                alert()
            } else{
                _answer8[0] = answer.text!
            }
            
            if answer2.text! == "" {
            } else{
                _answer8[1] = answer2.text!
            }
        }
        
        if valid == true{
            changeNumber("next")
        }
    }
    
    func alert(){
        let alert = UIAlertController(title: "", message: "Field can't be empty", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        Paws.shared.survey = Paws.surveyAnswer(_answer1: _answer1, _answer2: _answer2, _answer3: _answer3, _answer4: _answer4, _answer5: _answer5, _answer6: _answer6, _answer7: _answer7, _answer8: _answer8)
        let viewController = storyboard?.instantiateViewController(withIdentifier: "visit_shelter") as! VisitShelterViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func takeFotoPagar(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            photoIndicator = 1
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
//            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func takeFotoBalkon(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            photoIndicator = 2
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
//            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func takeFotoTempatAnjing(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            photoIndicator = 3
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
//            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func takeFotoTaman(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            photoIndicator = 4
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
        
        if photoIndicator == 1{
            fotoPagar_ = selectedImage
            fotoPagar.setImage(fotoPagar_, for: .normal)
//            _answer9![0] = fotoPagar_!
        } else if photoIndicator == 2{
            fotoBalkon_ = selectedImage
            fotoBalkon.setImage(fotoBalkon_, for: .normal)
//            _answer9![1] = fotoBalkon_!
        } else if photoIndicator == 3{
            fotoTempatAnjing_ = selectedImage
            fotoTempatAnjing.setImage(fotoTempatAnjing_, for: .normal)
//            _answer9![2] = fotoTempatAnjing_!
        } else if photoIndicator == 4{
            fotoTaman_ = selectedImage
            fotoTaman.setImage(fotoTaman_, for: .normal)
//            _answer9![3] = fotoTaman_!
        }
        // Set photoImageView to display the selected image.
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
}

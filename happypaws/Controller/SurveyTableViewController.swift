//
//  SurveyTableViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 02/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class SurveyTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var questions: UICollectionView!
    
    var cellIds: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var opt_survey1 : [String] = ["As a companion", "Guard dog", "Other"]
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions.delegate = self
        questions.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        picker.dataSource = self
        picker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(
            width: collectionView.bounds.width,
            height: collectionView.bounds.height
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell( withReuseIdentifier: cellIds[indexPath.item], for: indexPath)
    }
    
    @IBAction func next(_ sender: Any) {
        let visibleItems: NSArray = questions.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
        if nextItem.row < cellIds.count {
            questions.scrollToItem(at: nextItem, at: .left, animated: true)
        }
        
    }
    
    @IBAction func prev(_ sender: Any) {
        let visibleItems: NSArray = questions.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
        if nextItem.row < cellIds.count && nextItem.row >= 0{
            questions.scrollToItem(at: nextItem, at: .right, animated: true)
            
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return opt_survey1[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.view.endEditing(true)
    }
}

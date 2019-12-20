//
//  Survey1CollectionViewCell.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 05/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class Survey1CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tf_survey1: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tf_survey1.resignFirstResponder()
        return true
    }
}

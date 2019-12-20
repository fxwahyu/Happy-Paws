//
//  PawsDiaryCollectionViewCell.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 15/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class PawsDiaryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var views: UIView!
    var cornerRadius: CGFloat = 10.0
    
    func setView(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
        
        // set the cornerRadius of the containerView's layer
        views.layer.cornerRadius = cornerRadius
        views.layer.masksToBounds = true
        
//        addSubview(views)
    }
    
}

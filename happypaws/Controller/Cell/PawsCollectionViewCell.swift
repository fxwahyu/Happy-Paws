//
//  PawsCollectionViewCell.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 24/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class PawsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var paws_image: UIImageView!
    @IBOutlet weak var paws_name: UILabel!
    @IBOutlet weak var paws_desc: UILabel!
    @IBOutlet weak var paws_gender: UIImageView!
    @IBOutlet weak var view: UIView!
    private var shadowLayer: CAShapeLayer!
    var cornerRadius: CGFloat = 10.0
    
    func setView(){
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
//        view.layer.shadowOpacity = 0.2
//        view.layer.shadowRadius = 6
//
//        // set the cornerRadius of the containerView's layer
//        view.layer.cornerRadius = cornerRadius
//        view.layer.masksToBounds = true
        
//        addSubview(view)
    }
}

//
//  TOCCollectionViewCell.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 26/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class TOCCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var agreeButton: UIButton!
    
    func setupFont(_ text: String){
        let paragraphStyle = NSMutableParagraphStyle()
        //line height size
        paragraphStyle.lineHeightMultiple = 1.5
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        desc.attributedText = attrString
        desc.textAlignment = NSTextAlignment.center
    }
}

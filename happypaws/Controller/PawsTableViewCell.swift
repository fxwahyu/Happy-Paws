//
//  PawsTableViewCell.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 24/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class PawsTableViewCell: UITableViewCell {

    @IBOutlet weak var paws_image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

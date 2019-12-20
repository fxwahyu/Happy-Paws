//
//  DiaryListTableViewCell.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 14/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class DiaryListTableViewCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var adopted: UILabel!
    @IBOutlet weak var progres: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func done(){
        desc.isHidden = false
        adopted.isHidden = false
        progres.isHidden = true
    }
    
    func notDone(){
        desc.isHidden = true
        adopted.isHidden = true
        progres.isHidden = false
    }

}

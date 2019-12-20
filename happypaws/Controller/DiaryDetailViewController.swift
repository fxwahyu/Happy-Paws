//
//  DiaryDetailViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 16/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class DiaryDetailViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var date: UILabel!
    var diary: Paws.diary?
    override func viewDidLoad() {
        super.viewDidLoad()
        var cornerRadius: CGFloat = 10.0
        photo.layer.cornerRadius = cornerRadius
        photo.clipsToBounds = true
        
        photo.image = UIImage(named: diary!.photo!)
        content.text = diary?.content
        date.text = diary?.date
        
        setupFont(diary!.content!)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            let nav = self.navigationController?.navigationBar
            nav?.prefersLargeTitles = false
    }
    
    func setupFont(_ text: String){
        let paragraphStyle = NSMutableParagraphStyle()
        //line height size
        paragraphStyle.lineHeightMultiple = 1.5
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        content.attributedText = attrString
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

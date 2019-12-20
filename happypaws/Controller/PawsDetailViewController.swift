//
//  PawsDetailViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 25/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class PawsDetailViewController: UIViewController {
    var idAnjing: Int?
    @IBOutlet weak var containerView: UIView!
    //    @IBOutlet weak var collview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//       collview.dataSource = self
//        collview.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "informationDetail" {
            let childViewController = segue.destination as! InformationViewController
            childViewController.idAnjing = self.idAnjing
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.tabBarController?.tabBar.isHidden = true
        setupNavbar()
    }
    
    func setupNavbar(){
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = false
        nav?.setBackgroundImage(UIImage(), for: .default)
        nav?.shadowImage = UIImage()
        nav?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        nav?.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.barTintColor = nil
    }
    
    @IBAction func buttonAdopt(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "toc") as! TOCfirstViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    

}

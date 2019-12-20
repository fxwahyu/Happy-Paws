//
//  TOCViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 26/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class TOCViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var page: UIPageControl!
    
    var button: [Int] = [0,0,0,0,1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collView.dataSource = self
        collView.delegate = self
        page.numberOfPages = 5
        page.currentPage = 0
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.tabBarController?.tabBar.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "toc_cell", for: indexPath) as! TOCCollectionViewCell
        if indexPath.row == 4 {
            cell.agreeButton.isHidden = false
        } else{
            cell.agreeButton.isHidden = true
        }
        cell.photo.image = UIImage(named: Paws.shared.tocData_image[indexPath.row])
        cell.title.text = Paws.shared.tocData_title[indexPath.row]
        cell.desc.text = Paws.shared.tocData_desc[indexPath.row]
        cell.setupFont(Paws.shared.tocData_desc[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(
            width: collectionView.bounds.width,
            height: collectionView.bounds.height
        )
    }
    
    @IBAction func agree(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "signup") as! SignUpTableViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        page.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

}

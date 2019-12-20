//
//  PawsViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 24/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class PawsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
    
    @IBOutlet weak var paws_colelction: UICollectionView!
//    var feedItems: NSArray = NSArray()
    let kCellHeight : CGFloat = 240
    let kLineSpacing : CGFloat = 5
    let kInset : CGFloat = 15
    var listAnjing = Paws.shared.anjings
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paws_colelction.delegate = self
        paws_colelction.dataSource = self
//        let anjingModel = AnjingModel()
//        anjingModel.downloadItems()
//        anjingModel.delegate = self
    }
    
//    func itemsDownloaded(items: NSArray) {
//
//        feedItems = items
//        self.paws_colelction.reloadData()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        setupNavBar()
    }
    
    func setupNavBar(){
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = true
    
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        var image = UIImage(named: "profile")
        image = image?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(signIn))
    }
    
    @objc func signIn(){
        let viewController = storyboard?.instantiateViewController(withIdentifier: "signIn") as! SignInViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (UIScreen.main.bounds.width - 2*kInset - kLineSpacing)/2, height: kCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return kLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: kInset, left: kInset, bottom: kInset, right: kInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "paws_cell", for: indexPath) as! PawsCollectionViewCell
        let anjingg = listAnjing[indexPath.row]
        
        cell.paws_image.image = UIImage(named: anjingg.photo[0])
        cell.paws_name.text = anjingg.name
        cell.paws_desc.text = "\(anjingg.age) Yrs • \(anjingg.race) • \(anjingg.gender)"
        if anjingg.gender == "Male"{
            cell.paws_gender.image = UIImage(named: "male")
        } else {
            cell.paws_gender.image = UIImage(named: "female")
        }
        
//        cell.paws_gender.image = UIImage(named: "male")
//        cell.setView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "paws_detail") as! PawsDetailViewController
        viewController.idAnjing = indexPath.row
        Paws.shared.chosenDog = listAnjing[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }

}

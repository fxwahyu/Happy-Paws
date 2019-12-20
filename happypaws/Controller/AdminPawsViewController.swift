//
//  PawsViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 24/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class AdminPawsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
    

    @IBOutlet weak var paws_collection: UICollectionView!
    
    var images : [String] = ["anjing", "anjing 2", "anjing 5", "anjing 6", "anjing 7", "anjing 8", "anjing 9"]
    var name : [String] = ["Blake", "Boy", "Sheila", "Sharpnel", "Visage", "Kunka", "Blacky"]
    
    let numberOfCells = 9
    let kCellHeight : CGFloat = 240
    let kLineSpacing : CGFloat = 20
    let kInset : CGFloat = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paws_collection.delegate = self
        paws_collection.dataSource = self
    }
    
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
        
        var add = UIImage(named: "add")
        var profile = UIImage(named: "profile")
        
        add = add?.withRenderingMode(.alwaysOriginal)
        profile = profile?.withRenderingMode(.alwaysOriginal)
        
        let addButton   = UIBarButtonItem(image: add,  style: .plain, target: self, action: "add:")
        let profileButton = UIBarButtonItem(image: profile,  style: .plain, target: self, action: "profile:")
        
        navigationItem.rightBarButtonItems = [addButton, profileButton]
    }
    
    func add(){
        let viewController = storyboard?.instantiateViewController(withIdentifier: "addDiary") as! AddDiaryViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func profile(){
        let viewController = storyboard?.instantiateViewController(withIdentifier: "adminSignOut") as! AdminSignOutViewController
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
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "paws_cell", for: indexPath) as! PawsCollectionViewCell
        cell.paws_image.image = UIImage(named: images[indexPath.row])
        cell.paws_name.text = name[indexPath.row]
        cell.paws_desc.text = "Pug, 1yrs"
        cell.paws_gender.image = UIImage(named: "male")
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let viewController = storyboard?.instantiateViewController(withIdentifier: "paws_detail") as! PawsDetailViewController
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }
    
}

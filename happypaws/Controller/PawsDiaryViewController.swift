//
//  PawsDiaryViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 15/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit

class PawsDiaryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collView: UICollectionView!
    var dog = Paws.shared.chosenDog
    var diaryList = Paws.shared.diaries
    var diary: [Paws.diary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collView.dataSource = self
        collView.delegate = self
        print(Paws.shared.diaries.count)
        self.title = "\(dog!.name)'s Diary"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    func setupNavBar(){
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = true
        nav?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nav?.setBackgroundImage(UIImage(), for: .default)
        nav?.shadowImage = UIImage()
        
        var image = UIImage(named: "add")
        image = image?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addTapped))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diaryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pawsDiary", for: indexPath) as! PawsDiaryCollectionViewCell
        
        if diaryList == nil{
            
        } else {
            cell.foto.image = UIImage(named: diaryList[indexPath.row].photo!)
            cell.date.text = diaryList[indexPath.row].date
            cell.content.text = diaryList[indexPath.row].content
            cell.setView()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "diaryDetail") as! DiaryDetailViewController
        viewController.diary = diaryList[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)

    }
    
    @objc func addTapped(){
        let viewController = storyboard?.instantiateViewController(withIdentifier: "addDiary") as! AddDiaryViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

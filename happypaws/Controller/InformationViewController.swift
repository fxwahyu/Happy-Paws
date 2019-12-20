//
//  InformationViewController.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 25/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit
import AVKit

class InformationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
//    var photos: [String] = ["anjing", "anjing 2", "anjing 3", "anjing 4", "anjing 5", "anjing 6", "anjing 7", "anjing 8", "anjing 9"]
    var idAnjing: Int?
    var anjing: Paws.anjing?
    
    @IBOutlet weak var pageControler: UIPageControl!
    @IBOutlet weak var collview: UICollectionView!
    
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var gender: UIImageView!
    @IBOutlet weak var story: UILabel!
    @IBOutlet weak var vaksin: UIImageView!
    @IBOutlet weak var sterile: UIImageView!
    @IBOutlet weak var requirements: UILabel!
    @IBOutlet weak var doctor: UILabel!
    
    var videoURL = URL(string: "")
//    var feedItems: NSArray = NSArray()
//    var selectedAnjing : Anjing = Anjing()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collview.delegate = self
        collview.dataSource = self
        anjing = Paws.shared.anjings[idAnjing!]
        videoURL = URL(string: anjing!.video)
        pageControler.numberOfPages = (anjing?.photo.count)!+1
        pageControler.currentPage = 0
        // Do any additional setup after loading the view.
//        let anjingModel = AnjingModel()
//        anjingModel.downloadItems()
//        anjingModel.delegate = self
        setData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (anjing?.photo.count)!+1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "paws_cell", for: indexPath) as! PawsDetailCollectionViewCell
        if indexPath.row == 0{ //buat video
//            cell.video.isHidden = false
            cell.buttonPlay.isHidden = false
            cell.getThumbnailImageFromVideoUrl(url: videoURL!) { (thumbImage) in cell.paws_photo.image = thumbImage }
            
        } else{ //buat foto
            cell.buttonPlay.isHidden = true
            cell.paws_photo.image = UIImage(named: (anjing?.photo[indexPath.row-1])!)
        }
        
        return cell
    }
    
    func setData(){
        nama.text = anjing?.name
        desc.text = "\(anjing!.age) Yrs • \(anjing!.race) • \(anjing!.gender)"
        if anjing!.gender == "Male"{
            gender.image = UIImage(named: "male")
        } else {
            gender.image = UIImage(named: "female")
        }
        story.text = anjing!.story
        requirements.text = anjing!.requirement
        doctor.text = anjing!.doctor
    }
    
//    func itemsDownloaded(items: NSArray) {
//        feedItems = items
//        print("sadadsasd")
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(
            width: collectionView.bounds.width,
            height: collectionView.bounds.height
        )
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControler.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    @IBAction func play(_ sender: Any) {
        
        let vid = AVPlayer(url: videoURL!)
        let videoPlayer = AVPlayerViewController()
        videoPlayer.player = vid
        
        self.present(videoPlayer, animated: true, completion: {
            vid.play()
        })
    }
    
}

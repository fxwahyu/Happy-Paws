//
//  PawsDetailCollectionViewCell.swift
//  happypaws
//
//  Created by Wahyu Herdianto on 25/07/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import UIKit
import AVKit

class PawsDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var paws_photo: UIImageView!
    @IBOutlet weak var buttonPlay: UIButton!
    
    func getThumbnailImageFromVideoUrl(url: URL, completion: @escaping ((_ image: UIImage?)->Void)) { DispatchQueue.global().async {
        //1
        let asset = AVAsset(url: url)
        //2
        let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
        //3
        avAssetImageGenerator.appliesPreferredTrackTransform = true
        //4
        let thumnailTime = CMTimeMake(value: 2, timescale: 1)
        //5
        do { let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil)
        //6
            let thumbImage = UIImage(cgImage: cgThumbImage)
        //7
        DispatchQueue.main.async {
            completion(thumbImage)
        } } catch { print(error.localizedDescription)
        //10
            DispatchQueue.main.async { completion(nil) //11
                
            } } } }
    
}

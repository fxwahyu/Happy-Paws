//
//  HomeModel.swift
//  SwiftDatabaseTutorial
//
//  Created by Steven Tanjung on 24/07/19.
//  Copyright © 2019 Steven Tanjung. All rights reserved.
//

import Foundation

protocol AnjingModelDetailProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class AnjingModelDetail: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: AnjingModelDetailProtocol!
    
    let urlPath = "http://steventanjung.com/apps/PawsInfo.php" //this will be changed to the path where service.php lives
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let anjings = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let anjing = Anjing()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let id = jsonElement["Id"] as? String,
                let nama = jsonElement["Nama"] as? String,
                let video = jsonElement["Video"] as? String,
                let ras = jsonElement["Ras"] as? String,
                let umur = jsonElement["Umur"] as? Int,
                let desc = jsonElement["Deskripsi"] as? String,
                let doctor = jsonElement["Doctor"] as? String,
                let gender = jsonElement["Gender"] as? String,
                let habit = jsonElement["Habit"] as? String,
                let vaksin = jsonElement["Vaksin"] as? Int,
                let sterile = jsonElement["Sterile"] as? Int,
                let size = jsonElement["Size"] as? String
            {
                anjing.id = id
                anjing.nama = nama
                anjing.ras = ras
                anjing.video = video
                anjing.umur = umur
                anjing.desc = desc
                anjing.doctor = doctor
                anjing.gender = gender
                anjing.habit = habit
                anjing.vaksin = vaksin
                anjing.sterile = sterile
                anjing.size = size
                
                
            }
            
            anjings.add(anjing)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: anjings)
            
        })
    }
}


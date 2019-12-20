//
//  HomeModel.swift
//  SwiftDatabaseTutorial
//
//  Created by Steven Tanjung on 24/07/19.
//  Copyright © 2019 Steven Tanjung. All rights reserved.
//

import Foundation

protocol AdopterModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class AdopterModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: AdopterModelProtocol!
    
    let urlPath = "http://steventanjung.com/apps/AdopterInfo.php" //this will be changed to the path where service.php lives
    
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
        let adopters = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let adopter = Adopter()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let id = jsonElement["Id"] as? Int,
                let ktp = jsonElement["Ktp"] as? String,
                let address = jsonElement["Address"] as? String,
                let job = jsonElement["Job"] as? String,
                let phone = jsonElement["Phone"] as? String,
                let password = jsonElement["Password"] as? String
            {
                adopter.id = id
                adopter.ktp = ktp
                adopter.address = address
                adopter.job = job
                adopter.phone = phone
                adopter.password = password
                
            }
            adopters.add(adopter)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: adopters)
            
        })
    }
}


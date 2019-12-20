//
//  HomeModel.swift
//  SwiftDatabaseTutorial
//
//  Created by Steven Tanjung on 24/07/19.
//  Copyright © 2019 Steven Tanjung. All rights reserved.
//

import Foundation

protocol AnjingFotoModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class AnjingFotoModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: AnjingFotoModelProtocol!
    
    let urlPath = "http://steventanjung.com/apps/pawsFoto.php" //this will be changed to the path where service.php lives
    
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
        let anjingFotos = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let anjingFoto = AnjingFoto()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let id = jsonElement["Id"] as? Int,
                let foto = jsonElement["foto"] as? String
            {
                anjingFoto.id = id
                anjingFoto.foto = foto
                
            }
            
            anjingFotos.add(anjingFoto)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: anjingFotos)
            
        })
    }
}


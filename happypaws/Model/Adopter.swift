//
//  Anjing.swift
//  happypaws
//
//  Created by Steven Tanjung on 19/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import Foundation

class Adopter: NSObject {
    var id : Int?
    var ktp: String?
    var address: String?
    var job: String?
    var phone: String?
    var password: String?
    
    override init()
    {
        
    }
    
    init(id: Int, ktp :String, address: String, job: String, phone: String, password: String) {
        self.id = id
        self.ktp = ktp
        self.address = address
        self.job = job
        self.phone = phone
        self.password = password
    }
}

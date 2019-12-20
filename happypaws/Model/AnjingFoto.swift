//
//  Anjing.swift
//  happypaws
//
//  Created by Steven Tanjung on 19/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import Foundation

class AnjingFoto: NSObject {
    var id : Int?
    var foto: String?
    
    override init()
    {
        
    }
    
    init(id: Int, foto: String) {
        self.id = id
        self.foto = foto
    }
}

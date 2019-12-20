//
//  Anjing.swift
//  happypaws
//
//  Created by Steven Tanjung on 19/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import Foundation

class Anjing: NSObject {
    var id : String?
    var nama: String?
    var video: String?
    var ras: String?
    var umur: Int?
    var desc: String?
    var doctor: String?
    var gender: String?
    var habit: String?
    var vaksin: Int?
    var sterile: Int?
    var size: String?
    
    override init()
    {
        
    }
    
    init(id: String, nama: String, video: String, ras: String, umur: Int,desc: String,doctor: String, gender: String, habit: String,vaksin: Int, sterile: Int, size: String) {
        self.id = id
        self.nama = nama
        self.video = video
        self.ras = ras
        self.umur = umur
        self.desc = desc
        self.doctor = doctor
        self.gender = gender
        self.habit = habit
        self.vaksin = vaksin
        self.sterile = sterile
        self.size = size
    }
}

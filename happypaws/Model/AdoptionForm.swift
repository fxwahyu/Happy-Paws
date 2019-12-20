//
//  Adopter.swift
//  happypaws
//
//  Created by Steven Tanjung on 19/08/19.
//  Copyright © 2019 Wahyu Herdianto. All rights reserved.
//

import Foundation

class AdoptionForm: NSObject {
    var id : Int?
    var alasan: String?
    var pernah: Bool?
    var umurHewan: Int?
    var jenisKelamin: String?
    var pengetahuan: Bool?
    var vaksin: Bool?
    var bersedia: Bool?
    var pergi: String?
    var statusRumah: String?
    var siapaRawat: String?
    var pagar: String?
    var balkon: String?
    var tempat: String?
    var taman: String?
    var date: String?
    var time: String?
    
    override init()
    {
        
    }
    
    init(id: Int, alasan: String, pernah: Bool, umurHewan: Int, jenisKelamin: String, pengetahuan:Bool, vaksin:Bool, bersedia: Bool, pergi: String, statusRumah:String, siapaRawat: String, pagar: String, balkon: String, tempat: String, taman: String, date: String, time: String) {
        self.id = id
        self.alasan = alasan
        self.pernah = pernah
        self.umurHewan = umurHewan
        self.jenisKelamin = jenisKelamin
        self.pengetahuan = pengetahuan
        self.vaksin = vaksin
        self.bersedia = bersedia
        self.pergi = pergi
        self.statusRumah = statusRumah
        self.siapaRawat = siapaRawat
        self.pagar = pagar
        self.balkon = balkon
        self.tempat = tempat
        self.taman = taman
        self.date = date
        self.time = time
    }
}

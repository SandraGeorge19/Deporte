//
//  Sport.swift
//  Deporte
//
//  Created by sandra on 1/28/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import Foundation

class Sport : Decodable{
//    var idSport : String?
//    var strSport : String?
//    var strFormat : String?
//    var strSportThumb : String?
//    var strSportIconGreen : String?
//    var strSportDescription : String?
    var image : String?
    var title : String?

    init(image : String , title : String) {
        self.image = image
        self.title = title
    }
}

class MySport : Decodable{
    var idSport : String?
    var strSport : String?
    var strFormat : String?
    var strSportThumb : String?
    var strSportIconGreen : String?
    var strSportDescription : String?
}

class AllSports : Decodable{
    var sports : [MySport]
}

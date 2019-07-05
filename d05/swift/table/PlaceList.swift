//
//  PlaceList.swift
//  d05
//
//  Created by Danyil ZBOROVKYI on 7/1/19.
//  Copyright © 2019 Danyil ZBOROVKYI. All rights reserved.
//

import Foundation

var indexPlace: Int = 0

class PlaceList {
    var placeList: [Place] = []
    
    init() {
        let row0item = Place()
        let row1item = Place()
        let row2item = Place()
        let row3item = Place()
        
        row0item.title = "School 42"
        row1item.title = "McDonalds Lukyanovca"
        row2item.title = "My flat"
        row3item.title = "Bukovel"
        
        row0item.subTitle = "Interesting or not"
        row1item.subTitle = "Om nom nom"
        row2item.subTitle = "One love"
        row3item.subTitle = "Winter is coming"
        
        row0item.latitude = 48.896562
        row0item.longitude = 2.318444
        
        row1item.latitude = 50.462502
        row1item.longitude = 30.481465
        
        row2item.latitude = 41.405016
        row2item.longitude = 2.212193
        
        row3item.latitude = 48.365109
        row3item.longitude = 24.400510
        
        row0item.pinColor = .green
        row1item.pinColor = .red
        row2item.pinColor = .blue
        row3item.pinColor = .yellow
        
        placeList.append(row0item)
        placeList.append(row1item)
        placeList.append(row2item)
        placeList.append(row3item)
    }
}

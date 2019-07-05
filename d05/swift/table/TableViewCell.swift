//
//  TableViewCell.swift
//  d05
//
//  Created by Danyil ZBOROVKYI on 7/1/19.
//  Copyright © 2019 Danyil ZBOROVKYI. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var placeLabel: UILabel!
    
    func cellConfigurate(place: Place?) {
        if let place = place {
            placeLabel.text = place.title
        }
    }
}

//
//  TableViewCell.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/06.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import UIKit
import SwiftyJSON

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var pickImage: UIImageView!
    @IBOutlet weak var pickName: UILabel!
    @IBOutlet weak var pickDate: UILabel!
    @IBOutlet weak var pickPlace: UILabel!
    @IBOutlet weak var pickDetail: UILabel!
    
    func setCell(item: Item) {
        pickName.text = item.name
        pickDate.text = item.date
        pickPlace.text = item.place
        pickDetail.text = item.detail
    }

}

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pickImage: UIImageView!
    @IBOutlet weak var pickName: UILabel!
    @IBOutlet weak var pickDate: UILabel!
    @IBOutlet weak var pickPlace: UILabel!
    @IBOutlet weak var pickDetail: UILabel!
    
    func setCell(item: Item) {
        pickName.text = item.name
        pickDate.text = item.date
        pickPlace.text = getPlace(place: item.place)
        pickDetail.text = item.detail
    }
    
    func getPlace(place: String) -> String {
        switch place {
        case "north":
            return "北口"
        case "south":
            return "南口"
        case "east":
            return "東口"
        case "west":
            return "西口"
        case "center":
            return "中央口"
        default:
            return "その他"
        }
    }
    
}

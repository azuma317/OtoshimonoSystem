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

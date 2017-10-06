//
//  Model.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/06.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import Foundation
import SwiftyJSON

// 落とし物の構造体
struct Item {
    let id: Int
    let name: String
    let date: String
    let place: String
    let kind: Int
    let detail: String
    let image: String
    
    init(json: JSON) {
        id = json["id_number"].intValue
        name = json["lost_title"].stringValue
        date = json["pick_date"].stringValue
        place = json["pick_place"].stringValue
        kind = json["lost_kind"].intValue
        detail = json["lost_detail"].stringValue
    }
}

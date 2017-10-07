//
//  Model.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/06.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Item {
    let id: Int
    let name: String
    let date: String
    let place: String
    let kind: Int
    let detail: String
    
    init(json: JSON) {
        id = json["id"].intValue
        name = json["title"].stringValue
        date = json["date"].stringValue
        place = json["place"].stringValue
        kind = json["kind"].intValue
        detail = json["detail"].stringValue
    }
}

//
//  ViewController.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/06.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    // jsonを返してくれるURL
    let url: String = "http://macintosh-no-macbook-pro.local:8888/user_get.php"
    
    var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Request(path: url).request(success:{ (data: Dictionary) in
            
            // jsonのデータをitemsに格納
            let json = JSON(data)
            
            self.items = json.arrayValue.map(Item.init(json: ))
            
        }, fail:{ (error: Error?) in
            
            //http通信に失敗したとき
            print(error ?? 0)
            
        })
        
    }
    
}

//extension ViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell =
//
//        return cell
//    }
//}


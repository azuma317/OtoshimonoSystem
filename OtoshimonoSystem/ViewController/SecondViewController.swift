//
//  SecondViewController.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/06.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData(item: item!)
    }
    
    // Itemの変数から直接値を代入
    func setData(item: Item) {
        name.text = item.name
        id.text = String(item.id)
        date.text = item.date
        place.text = item.place
        detail.text = item.detail
    }

    // 戻るボタンで画面を閉じる
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }

}

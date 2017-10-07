//
//  SecondViewController.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/06.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import UIKit
import AlamofireImage

// 落とし物の詳細を表示するView
class SecondViewController: ViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // itemがOptional型にしているので??0を入れておく
        let url: URL = URL(string: "http://macintosh-no-macbook-pro.local:8888/image/\(item?.id ?? 0).jpeg")!
        
        setData(item: item!)
        imageView.af_setImage(withURL: url)
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

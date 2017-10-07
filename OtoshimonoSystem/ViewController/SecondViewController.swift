//
//  SecondViewController.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/06.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import UIKit
import AlamofireImage

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
        
        let url: URL = URL(string: "落とし物の写真のURL")!
        
        setData(item: item!)
        imageView.af_setImage(withURL: url)
    }
    
    func setData(item: Item) {
        name.text = item.name
        id.text = String(item.id)
        date.text = item.date
        place.text = item.place
        detail.text = item.detail
    }

    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }

}

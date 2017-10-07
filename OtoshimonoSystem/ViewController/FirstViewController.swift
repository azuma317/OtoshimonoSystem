//
//  ViewController.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/06.
//  Copyright © 2017年 Azuma. All rights reserved.
//  わからない所があれば、メールをください。
//  mail: lifeghtcloerce5291@ezweb.ne.jp
//

import UIKit
import SwiftyJSON
import AlamofireImage
import Alamofire

// 最初のView
class ViewController: UIViewController {
    
    // jsonを返してくれるURL
    let url: String = "http://macintosh-no-macbook-pro.local:8888/user_get.php"
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [Item] = []

    // 最初に呼ばれる処理
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }
    
    // 更新ボタン
    @IBAction func renewal(_ sender: Any) {
        
        getData()
        
        tableView.reloadData()
    }
    
    // カテゴリごとで検索
    @IBAction func search(_ sender: Any) {
        
        let storyboard = self.storyboard
        let searchView = storyboard?.instantiateViewController(withIdentifier: "searchView") as! SearchViewController
        searchView.items = items
        present(searchView, animated: true, completion: nil)
    }
    
    // 非同期処理でデータを取得
    private func getData() {
        
        Request(path: url).request(success:{ (data: Any) in
            
            self.items = []
            
            // jsonのデータをitemsに格納
            let json = JSON(data)
            
            print(json)
            
            self.items = json.arrayValue.map(Item.init(json: ))
            
        } , fail:{ (error: Error?) in
            
            //http通信に失敗したとき
            print(error ?? 0)
        })
    }
}

// TableViewの情報を追加するところ
extension ViewController: UITableViewDataSource {
    
    // Cellの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // Cell情報
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.setCell(item: items[indexPath.item])
        
        cell.imageView?.af_setImage(withURL: URL(string: "http://macintosh-no-macbook-pro.local:8888/image/\(items[indexPath.item].id).jpeg")!)
        
        return cell
    }
}

// TableViewのCell選択時の遷移やCellの高さを設定するところ
extension ViewController: UITableViewDelegate {
    
    // Cellの高さを設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // cellが選択されたときの遷移処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //遷移先のView選択と遷移の処理
        let storyboard = self.storyboard
        let secondView = storyboard?.instantiateViewController(withIdentifier: "secondView") as! SecondViewController
        secondView.item = items[indexPath.item]
        present(secondView, animated: true, completion: nil)
        
    }
    
}


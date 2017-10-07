//
//  ViewController.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/06.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireImage
import Alamofire

class ViewController: UIViewController {
    
    let url: String = "JSONを返してくれるURL"
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }
    
    @IBAction func renewal(_ sender: Any) {
        
        getData()
        
        tableView.reloadData()
    }
    
    @IBAction func search(_ sender: Any) {
        
        let storyboard = self.storyboard
        let searchView = storyboard?.instantiateViewController(withIdentifier: "searchView") as! SearchViewController
        searchView.items = items
        present(searchView, animated: true, completion: nil)
    }
    
    private func getData() {
        
        Request(path: url).request(success:{ (data: Any) in
            
            self.items = []
            
            let json = JSON(data)
            
            print(json)
            
            self.items = json.arrayValue.map(Item.init(json: ))
            
        } , fail:{ (error: Error?) in
            
            print(error ?? 0)
        })
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.setCell(item: items[indexPath.item])
        
        cell.imageView?.af_setImage(withURL: URL(string: "落とし物の写真のURL")!)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = self.storyboard
        let secondView = storyboard?.instantiateViewController(withIdentifier: "secondView") as! SecondViewController
        secondView.item = items[indexPath.item]
        present(secondView, animated: true, completion: nil)
        
    }
    
}


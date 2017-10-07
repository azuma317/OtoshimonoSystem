//
//  CategoryViewController.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/07.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import UIKit
import AlamofireImage

class CategoryViewController: UIViewController {
    
    var items: [Item] = []
    var selectedSection: Int?
    var selectedRow: Int?
    
    let places: [String] = ["north", "south", "east", "west", "center", "other"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = categoryItem(section: selectedSection!, row: selectedRow!)
        
        tableView.reloadData()
    }
    
    private func categoryItem(section: Int, row: Int) -> [Item] {
        
        var categoryItems: [Item] = []
        
        if section == 0 {
            
            for item in items {
                if item.place == places[row] {
                    categoryItems.append(item)
                }
            }
            return categoryItems
            
        } else if section == 1 {
            
            for item in items {
                if item.kind == row+1 {
                    categoryItems.append(item)
                }
            }
            return categoryItems
            
        } else {
            return categoryItems
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        cell.setCell(item: items[indexPath.item])
        
        cell.pickImage.af_setImage(withURL: URL(string: "落とし物の写真のURL")!)
        
        return cell
    }
}

extension CategoryViewController: UITableViewDelegate {
    
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

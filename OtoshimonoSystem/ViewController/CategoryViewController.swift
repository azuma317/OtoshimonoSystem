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

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = categoryItem(section: selectedSection!, row: selectedRow!)
        
        tableView.reloadData()
    }
    
    private func categoryItem(section: Int, row: Int) -> [Item] {
        
        var categoryItems: [Item] = []
        
        if section == 0 {
            
            if row == 0 {
                
                for item in items {
                    if item.place == "AV" {
                        categoryItems.append(item)
                    }
                }
                
                return categoryItems
            } else if row == 1 {
                
                for item in items {
                    if item.place == "AVE" {
                        categoryItems.append(item)
                    }
                }
                
                return categoryItems
            } else if row == 2 {
                
                for item in items {
                    if item.place == "3F" {
                        categoryItems.append(item)
                    }
                }
                
                return categoryItems
            } else if row == 3 {
                
                for item in items {
                    if item.place == "3F1" {
                        categoryItems.append(item)
                    }
                }
                
                return categoryItems
            } else if row == 4 {
                
                for item in items {
                    if item.place == "1F" {
                        categoryItems.append(item)
                    }
                }
                
                return categoryItems
            } else if row == 5 {
                
                for item in items {
                    if item.place == "2F" {
                        categoryItems.append(item)
                    }
                }
                
                return categoryItems
            } else {
                
                return categoryItems
            }
            
        } else if section == 1 {
            
            for item in items {
                if item.kind == row {
                    categoryItems.append(item)
                }
            }
            return categoryItems
            
        } else {
            return categoryItems
        }
    }

}

extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        cell.setCell(item: items[indexPath.item])
        
        cell.pickImage.af_setImage(withURL: URL(string: "http://macintosh-no-macbook-pro.local:8888/image/\(items[indexPath.item].id).jpeg")!)
        
        return cell
    }
}

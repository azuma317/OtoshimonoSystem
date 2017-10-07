//
//  CategoryViewController.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/07.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import UIKit
import AlamofireImage

// カテゴリごとの表示
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
        
        cell.pickImage.af_setImage(withURL: URL(string: "http://macintosh-no-macbook-pro.local:8888/image/\(items[indexPath.item].id).jpeg")!)
        
        return cell
    }
}

extension CategoryViewController: UITableViewDelegate {
    
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

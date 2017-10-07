//
//  SearchViewController.swift
//  OtoshimonoSystem
//
//  Created by Azuma on 2017/10/07.
//  Copyright © 2017年 Azuma. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let sectionTitle: [String] = ["場所", "種類"]
    let category1: [String] = ["北口", "南口", "東口", "西口", "中央口", "その他"]
    let category2: [String] = ["かさ", "教科書・本", "電子機器", "ノート・ファイル", "文房具", "衣類・タオル", "鍵・アクセサリー", "バッグ・シューズ", "その他"]
    
    var items: [Item]?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return category1.count
        } else {
            return category2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "")
        
        if indexPath.section == 0 {
            cell.textLabel?.text = category1[indexPath.item]
        } else {
            cell.textLabel?.text = category2[indexPath.item]
        }
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = self.storyboard
        let categoryView = storyboard?.instantiateViewController(withIdentifier: "categoryView") as! CategoryViewController
        categoryView.items = items!
        categoryView.selectedSection = indexPath.section
        categoryView.selectedRow = indexPath.item
        if indexPath.section == 0 {
            categoryView.name = category1[indexPath.item]
        } else if indexPath.section == 1 {
            categoryView.name = category2[indexPath.item]
        }
        present(categoryView, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

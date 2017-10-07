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
    let category1: [String] = ["AV講義室", "AV演習室", "端末講義室", "端末演習室", "1階ロビー", "2階ロビー", "その他"]
    let category2: [String] = ["かさ", "教科書・本", "電子機器", "ノート・ファイル", "文房具", "衣類・タオル", "鍵・アクセサリー", "バッグ・シューズ", "その他"]
    
    var items: [Item]?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 閉じる
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SearchViewController: UITableViewDataSource {
    
    // sectionの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    // sectionのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    // sectionの高さ
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
        present(categoryView, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

//
//  SecVC.swift
//  ConfigDragAndDrop
//
//  Created by Vinson Fan on 2017/6/19.
//  Copyright © 2017年 amoyio. All rights reserved.
//

import UIKit
class SecVC: UITableViewController {
    
    let initialData = [2,3,4,5,6,6,78,3,9,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return initialData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seccell") as! UITableViewCell
        cell.textLabel?.text = "====>\(initialData[indexPath.row])"
        return cell
    }
}

extension SecVC:UITableViewDragDelegate{
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let data = "LLLLLLL\(initialData[indexPath.row])" as NSString
        let provider = NSItemProvider(object: data)
        let dragItem = UIDragItem(itemProvider: provider)
        return [dragItem]
    }
    
}

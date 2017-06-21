//
//  ViewController.swift
//  ConfigDragAndDrop
//
//  Created by Vinson Fan on 2017/6/19.
//  Copyright © 2017年 amoyio. All rights reserved.
//

import UIKit

enum NewFeature:String {
    case SFSafariViewController
    case DragAndDrop
}

class ViewController: UITableViewController {
    var initialString:[NewFeature] = [.SFSafariViewController,.DragAndDrop]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dropDelegate = self
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "iOS 11"
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return initialString.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = initialString[indexPath.row].rawValue
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "infoVC")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    

}

extension ViewController:UITableViewDropDelegate{
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destination = coordinator.destinationIndexPath ?? IndexPath(row: 0, section: 0)
        let data = coordinator.session.loadObjects(ofClass: NSString.self) { items in
            guard let string = items as? [String] else { return }
            self.initialString.insert(NewFeature(rawValue: string.first!)!, at: destination.row)
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
}

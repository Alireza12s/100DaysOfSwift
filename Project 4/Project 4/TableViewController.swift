//
//  TableTableViewController.swift
//  Project 4
//
//  Created by ali on 8/3/19.
//  Copyright © 2019 Alireza. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var websites = ["apple.com","hackingwithswift.com"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }




    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        if let vc = storyboard?.instantiateViewController(identifier: "WebView") as? ViewController{
            vc.websites = websites
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

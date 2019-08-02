//
//  ViewController.swift
//  Project 1-3
//
//  Created by ali on 8/2/19.
//  Copyright © 2019 Alireza. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let countries: [String] = ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true

        
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        cell.textLabel?.text = countries[indexPath.row].uppercased()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.imageName = countries[indexPath.row]
            
            
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}


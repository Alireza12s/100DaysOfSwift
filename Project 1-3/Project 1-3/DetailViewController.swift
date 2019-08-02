//
//  DetailViewController.swift
//  Project 1-3
//
//  Created by ali on 8/2/19.
//  Copyright © 2019 Alireza. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageName: String? = nil
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = imageName?.uppercased() ?? "US"
        imageView.image = UIImage(named: imageName ?? "us")
        
        navigationItem.largeTitleDisplayMode = .never

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    
    
    @objc func shareFlag(){
        
        let error = UIAlertController(title: "NO image", message: "There is no image to share", preferredStyle: .alert)
        error.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (action) in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.9) else {
            present(error, animated: true)
            return
        }
        
        guard let name = imageName?.uppercased() else {
            present(error, animated: true)
            return
        }
        
        let shareVc = UIActivityViewController(activityItems: [name , image], applicationActivities: [])
        shareVc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(shareVc, animated: true)
        
    }
    
    
}

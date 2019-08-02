//
//  DetailViewController.swift
//  Project1
//
//  Created by TwoStraws on 12/08/2016.
//  Copyright © 2016 Paul Hudson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet var imageView: UIImageView!
	var selectedImage: String?
    var picturesCount: Int?
    var pictureNumber: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Picture \(pictureNumber!) of \(picturesCount!)"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

		if let imageToLoad = selectedImage {
			imageView.image  = UIImage(named: imageToLoad)
		}
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 1) else {
            print("ERROR NO Image")
            return
        }
        
        guard let imageName = selectedImage else {
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}

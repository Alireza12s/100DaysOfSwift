//
//  ViewController.swift
//  Project 2
//
//  Created by ali on 7/31/19.
//  Copyright © 2019 Alireza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    
    @IBOutlet var navBar: UINavigationItem!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfQuestions = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["france","estonia","monaco","germany","nigeria","poland","russia","spain","uk","us","italy","ireland"]
        
        
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor
        
        navBar.title = "\(score)"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .done, target: self, action: #selector(showScore))
//            UIBarButtonItem(image: UIImage(systemName: "s.circle.fill"), style: .done, target: self, action: #selector(showScore))
//            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showScore))
        
        askQuestion()
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        Button1.setImage(UIImage(named: countries[0]), for: .normal)
        Button2.setImage(UIImage(named: countries[1]), for: .normal)
        Button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        
        title = countries[correctAnswer].uppercased()
        numberOfQuestions += 1
    }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            message = "Your score is \(score)"
        } else {
            title  = "Wrong"
            score -= 1
            message = "That's the flag of \(countries[sender.tag].uppercased())"
        }
        navBar.title = "\(score)"
        
        if numberOfQuestions != 10{
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (action) in
                self.askQuestion()
            }))
            present(ac, animated: true)
            
        } else {
            let ac = UIAlertController(title: "Finished", message: "Your score is \(self.score) after answering 10 questions", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart", style: .destructive, handler: { (action) in
                self.numberOfQuestions = 0
                self.score = 0
                self.navBar.title = "\(self.score)"
                self.askQuestion()
            }))
            present(ac, animated: true)
        }
        
        
    }
    
    
    @objc func showScore(){
        navigationItem.rightBarButtonItem?.title = "\(self.score)"
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
            self.navigationItem.rightBarButtonItem?.title = "Score"
        })
    }
    
    
}

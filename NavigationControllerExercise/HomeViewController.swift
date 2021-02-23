//
//  ViewController.swift
//  NavigationControllerExercise
//
//  Created by Field Employee on 2/22/21.
//

import UIKit



class HomeViewController: UIViewController {
    
    let redKey = "notificationRed"
    let greenKey = "notificationGreen"
    let yellowKey = "notificationYellow"
    let orangeKey = "notificationOrange"
    let blackKey = "notificationBlack"
    
    @IBOutlet weak var topLabel: UILabel!
    
   
    
    
    override func viewDidLoad() {
        
        createObserver()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
    private func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateScreen(_:)), name: NSNotification.Name(rawValue: redKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateScreen(_:)), name: NSNotification.Name(rawValue: greenKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateScreen(_:)), name: NSNotification.Name(rawValue: yellowKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateScreen(_:)), name: NSNotification.Name(rawValue: orangeKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateScreen(_:)), name: NSNotification.Name(rawValue: blackKey), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateScreen(_ notification: NSNotification) {
        if let tag = notification.userInfo?["tag"] as? Int {
            topLabel.isHidden = false
            topLabel.textColor = .black
            switch tag {
            case 0:
                view.backgroundColor = .red
                topLabel.text = "You've selected red"
            case 1:
                view.backgroundColor = .green
                topLabel.text = "You've selected green"
            case 2:
                view.backgroundColor = .yellow
                topLabel.text = "You've selected yellow"
            case 3:
                view.backgroundColor = .orange
                topLabel.text = "You've selected orange"
            case 4:
                view.backgroundColor = .black
                topLabel.textColor = .white
                topLabel.text = "You've selected black"
            default:
                break
            }
        }
    }
    
    
    
    
 
    
    
}


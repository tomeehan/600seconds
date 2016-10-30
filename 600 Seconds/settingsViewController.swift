//
//  settingsViewController.swift
//  600 Seconds
//
//  Created by Thomas Meehan on 20/08/2016.
//  Copyright © 2016 com.test. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var personaliseButton: UIButton!
    @IBOutlet var confirmationLabel: UILabel!
    
    @IBAction func userNameTextField(_ sender: UITextField) {
        
    }
    @IBAction func personaliseButton(_ sender: AnyObject) {
        userName = String(userNameTextField.text!)
        confirmationLabel.text? = "Hi, \(userName)!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personaliseButton.layer.shadowColor = UIColor.black.cgColor
        personaliseButton.layer.shadowOffset = CGSize(width: 2, height: 1)
        personaliseButton.layer.shadowRadius = 3
        personaliseButton.layer.shadowOpacity = 0.2
        
//        if userName == "DefaultName1999" {
//            confirmationLabel.hidden = true
//        } else {
//            confirmationLabel.hidden = false
//        }
    }
}

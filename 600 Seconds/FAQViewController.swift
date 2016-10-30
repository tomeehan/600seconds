//
//  FAQViewController.swift
//  600 Seconds
//
//  Created by Thomas Meehan on 21/08/2016.
//  Copyright © 2016 com.test. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController {

    @IBAction func openWebsite(_ sender: AnyObject) {
        if let url = URL(string: "http://tom-meehan.com") {
            UIApplication.shared.openURL(url)
        }
    }
}

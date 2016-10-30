//
//  ViewController.swift
//  600 Seconds
//
//  Created by Thomas Meehan on 20/08/2016.
//  Copyright © 2016 com.test. All rights reserved.
//

import UIKit
import AVFoundation

let path = Bundle.main.path(forResource: "completeSound.mp3", ofType:nil)!
let url = URL(fileURLWithPath: path)



var pushTimer = Timer()

var backgroundTask: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid

var completeSound: AVAudioPlayer!
let soundSystemIDpush: SystemSoundID = 1054 //
let soundSystemIDtap: SystemSoundID = 1104 // Keyboard tap sound

class ViewController: UIViewController {
    


    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    
    
    @IBAction func startButton(_ sender: AnyObject) {
        if timerIsOn == false {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            self.view.backgroundColor = UIColor(red:0.91, green:0.91, blue:0.91, alpha:1.0)
            registerBackgroundTask()
            AudioServicesPlaySystemSound (soundSystemIDtap)
            timerIsOn = true
            
            nameLabel.text = "Stay focused, \(userName)!"
            
        }
    }
    
    @IBAction func stopButton(_ sender: AnyObject) {
        
        timer.invalidate()
        seconds = 600
        timerLabel.text = "\(seconds)"
        timerIsOn = false
        self.view.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
        nameLabel.text = ""

    }
    
    func updateTimer(){
        
        seconds -= 1
        timerLabel.text = "\(seconds)"
        
        if seconds == 1 {
            timer.invalidate()
            //            endBackgroundTask()
            seconds = defaultSeconds
            timerLabel.text = "\(seconds)"
            timerIsOn = false
            
            registerBackgroundTask()
            //            pushNotification() // Commented becuase this caused two background notifications to be sent.
            let alertView = UIAlertController(title: "Stay Focused!", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alertView.addAction(UIAlertAction(title: "Okay!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertView, animated: true, completion: nil)
            self.view.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            
            // Send user a local notification if they have the app running in the bg
            pushTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pushNotification), userInfo: nil, repeats: false)
            do {
                let sound = try AVAudioPlayer(contentsOf: url)
                completeSound = sound
                sound.play()
            } catch {
                // couldn't play
            }
            
        }
        
    }
    
    func registerBackgroundTask() {
        backgroundTask = UIApplication.shared.beginBackgroundTask (expirationHandler: {
            [unowned self] in
            self.endBackgroundTask()
        })
        assert(backgroundTask != UIBackgroundTaskInvalid)
    }
    
    func endBackgroundTask() {
        NSLog("Background task ended.")
        UIApplication.shared.endBackgroundTask(backgroundTask)
        backgroundTask = UIBackgroundTaskInvalid
    }
    
    func pushNotification() {
        let notification = UILocalNotification()
        notification.alertAction = "Go back to App"
        notification.alertBody = "Stay focued!"
        notification.fireDate = Date(timeIntervalSinceNow: 1)
        UIApplication.shared.scheduleLocalNotification(notification)
        AudioServicesPlaySystemSound (soundSystemIDpush)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startButton.layer.shadowColor = UIColor.black.cgColor
        startButton.layer.shadowOffset = CGSize(width: 2, height: 1)
        startButton.layer.shadowRadius = 3
        startButton.layer.shadowOpacity = 0.2
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


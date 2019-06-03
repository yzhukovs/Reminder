//
// FirstViewController.swift
//  Reminder
//
//  Created by Yvette Zhukovsky on 5/19/19.
//  Copyright © 2019 Lambda School Labs. All rights reserved.
//

import UIKit
import UserNotifications

class FirstViewController: UIViewController {
   
 var notifications = [Notification]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var textReminder: UITextField!
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBOutlet weak var dailySwitch: UISwitch!
    
    
    @IBAction func setReminder(_ sender: AnyObject) {
        guard let bodyText = textReminder.text else { return }
     let components = Calendar.current.dateComponents([.hour, .minute], from: myDatePicker.date)
        
        let n = Notification(body: bodyText, rep: dailySwitch.isOn ? true:false, hour: components.hour ?? 0 , minute: components.minute ?? 0)
        
        let center = UNUserNotificationCenter.current()
        
        
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                DispatchQueue.main.async {
                    n.addRequest(center: center)
                    self.notifications.append(n)
                    print(self.notifications)
                }
                
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
        
    }
 
//    func createReminder() {
//
//        let center = UNUserNotificationCenter.current()
//        //center.removeAllPendingNotificationRequests()
//
//        let content = UNMutableNotificationContent()
//        content.title = UIDevice.current.name
//        content.body = textReminder.text ?? "Your Reminder"
//        content.categoryIdentifier = "alarm"
//        content.userInfo = ["customData": "fizzbuzz"]
//        content.sound = UNNotificationSound.defaultCritical
//
//        var dateComponents = DateComponents()
//        let components = Calendar.current.dateComponents([.hour, .minute], from: myDatePicker.date)
//        dateComponents.hour = components.hour
//        dateComponents.minute = components.minute
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: dailySwitch.isOn ? true:false)
//
//
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//        center.add(request)
//
//}
}

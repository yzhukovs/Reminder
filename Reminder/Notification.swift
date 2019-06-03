//
//  Notification.swift
//  Reminder
//
//  Created by Yvette Zhukovsky on 5/22/19.
//  Copyright © 2019 Lambda School Labs. All rights reserved.
//

import UIKit
import UserNotifications

struct Notification {
    let body: String
    let rep: Bool
    let hour: Int
    let minute: Int
    let id = UUID().uuidString
  
    
    public func addRequest(center: UNUserNotificationCenter) {
        // Initialize User Notification Center Object
    
        
        // The content of the Notification
        let content = UNMutableNotificationContent()
        content.title = UIDevice.current.name
        content.body = body
        content.sound = .default
        
        // The selected time to notify the user
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        // The time/repeat trigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Initializing the Notification Request object to add to the Notification Center
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
       
        
        
        // Adding the notification to the center
        center.add(request) { (error) in
            if (error) != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    
//    func addRequest(center: UNUserNotificationCenter, hour : Int, minutes: Int, repeating: Bool) {
//
//
//        let content = UNMutableNotificationContent()
//        content.title = UIDevice.current.name
//        content.body = body
//        content.categoryIdentifier = "alarm"
//        content.userInfo = ["customData": id ]
//        content.sound = UNNotificationSound.defaultCritical
//
//       // var date: Date
//        var dateComponents = DateComponents()
//        let components = Calendar.current.dateComponents([.hour, .minute], from: dateComponents.date!)
//        dateComponents.hour = components.hour
//        dateComponents.minute = components.minute
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: repeating)
//
//
//        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
//
//
//        center.add(request)
//
//    }
    
    
}

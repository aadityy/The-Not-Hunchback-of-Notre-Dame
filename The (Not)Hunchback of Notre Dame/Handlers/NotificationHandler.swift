//
//  NotificationHandler.swift
//  The (Not)Hunchback of Notre Dame
//
//  Created by Aadity Sharma on 12/7/23.
//

import Foundation
import UserNotifications

class NotificationHandler {
    
    func askPermission() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: 
            [.alert, .badge, .sound]) { success, error in
            if success {
                print("Permission Accepted")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func sendNotification(type: String, timeInterval: Double = 10, title: String, body: String) {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: true)
        
        let content = UNMutableNotificationContent()
        
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        print("notification sent")
        
        
    }
}

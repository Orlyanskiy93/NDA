//
//  NotificationsServiceImp.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 08.05.2021.
//

import UIKit
import UserNotifications

class NotificationsServiceImp: NotificationsService {
    static let shared = NotificationsServiceImp()
    let notificationCenter = UNUserNotificationCenter.current()

    private init() {}
    
    func setNotification(with timeInterval: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.body = String.Notifications.newSession
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        notificationCenter.add(request)
    }
}

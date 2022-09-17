//
//  AppNotifications.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/16/22.
//

import Foundation
import UserNotifications

public class AppNotifications: ObservableObject {
    @Published var scheduledNotifications = [ScheduledNotification]()
    
    @MainActor
    public func ScheduleNotification(timeFromNow: Double, message: String, name: String, type: NotificationType) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Notification permission verified")
                
                let content = UNMutableNotificationContent()
                
                switch (type) {
                case .upcoming:
                    content.title = "Upcoming milestone for \(name)"
                case .now:
                    content.title = "\(name) Milestone hit!"
                default:
                    content.title = "\(name)"
                }
                
                content.subtitle = message
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeFromNow, repeats: false)
                let notificationID = UUID().uuidString
                // choose a random identifier
                let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
                
                // add our notification request
                UNUserNotificationCenter.current().add(request)
                self.LogNotification(id: notificationID, content: content, event: name, timeFromNow: timeFromNow, type: type, unit: .seconds)
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    @MainActor
    public func HandleFormSubmission(eventTitle: String, delayTime: Double, enableUpcoming: Bool) {
        if(enableUpcoming) {
            if(delayTime - 10 > 0) {
                ScheduleNotification(timeFromNow: delayTime - 10, message: "Your \(delayTime) second milestone will occur in 10 seconds", name: eventTitle, type: .upcoming)
            }
            else {
                ScheduleNotification(timeFromNow: 2, message: "Your \(delayTime) second milestone will occur in a few seconds", name: eventTitle, type: .upcoming)
            }
        }
        
        ScheduleNotification(timeFromNow: delayTime, message: "Congratulations on \(delayTime) seconds!", name: eventTitle, type: .now)
    }

    @MainActor
    public func LogNotification(id: String, content: UNNotificationContent, event: String, timeFromNow: Double, type: NotificationType, unit: NotificationUnit) {
        let calendar = Calendar.current
        let notificationDate = calendar.date(byAdding: .second, value: Int(timeFromNow), to: Date.now)
        
        if let notificationDate = notificationDate {
            self.scheduledNotifications.append(ScheduledNotification(id: id, event: event, scheduledDate: notificationDate, type: type, unit: unit))
            print("logged notification")
        }
    }
}

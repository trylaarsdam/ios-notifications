//
//  ScheduledNotification.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/16/22.
//

import Foundation

public struct ScheduledNotification {
    var id: String
    var eventID: String?
    var event: String
    var scheduledDate: Date
    var type: NotificationType
    var unit: NotificationUnit
}

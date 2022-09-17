//
//  ScheduledNotification.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/16/22.
//

import Foundation

public struct ScheduledNotification: Identifiable {
    public var id: String
    public var eventID: String?
    public var event: String
    public var scheduledDate: Date
    public var type: NotificationType
    public var unit: NotificationUnit
}

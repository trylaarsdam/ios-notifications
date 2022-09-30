//
//  notificationsApp.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/16/22.
//

import SwiftUI
import UserNotifications

class AppDelegate : UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication,didReceiveRemoteNotification userInfo: [AnyHashable: Any],fetchCompletionHandler completionHandler:@escaping (UIBackgroundFetchResult) -> Void) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        print(userInfo) // the payload that is attached to the push notification
        // you can customize the notification presentation options. Below code will show notification banner as well as play a sound. If you want to add a badge too, add .badge in the array.
        completionHandler([.banner,.sound])
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        UNUserNotificationCenter.current().delegate = self
    }
}

@main
struct notificationsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                List() {
                    NavigationLink("Notifications Dev", destination: NotificationDevTest())
                    NavigationLink("Recurring Date Tests", destination: RecurringDateTests())
                    NavigationLink("User Defaults Explorer", destination: UserDefaultsExplorer())
                    NavigationLink("Settings", destination: SettingsPage())
                }.navigationTitle("Notifications Main").padding(.top)
            }
        }
    }
}

//
//  ContentView.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/16/22.
//

import SwiftUI

struct NotificationDevTest: View {
    @State var notificationDelayTime: Double = 5
    @State var enableUpcomingNotification: Bool = true
    @State var title = ""
    @State var showNotifications = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @StateObject var appNotifications = AppNotifications()
    
    var body: some View {
        VStack {
            Stepper(value: $notificationDelayTime, in: 5...100, step: 5) {
                Text("Delay Time: \(Int(notificationDelayTime)) sec")
            }
            Toggle(isOn: $enableUpcomingNotification,
                   label: {
                        Text("Enable upcoming notification")
                    }
            )
            TextField("Title", text: $title).textFieldStyle(.roundedBorder)
            Button(action: {
                appNotifications.HandleFormSubmission(eventTitle: title, delayTime: notificationDelayTime, enableUpcoming: enableUpcomingNotification)
                title = ""
                enableUpcomingNotification = true
                notificationDelayTime = 5
            }, label: {
                Text("Schedule")
            }).buttonStyle(.borderedProminent)
            HStack {
                Text("Scheduled Notifications").font(.title).padding(.top)
                Spacer()
            }
            List {
                if(showNotifications) {
                    ForEach(appNotifications.scheduledNotifications) { notification in
                        if(notification.scheduledDate > Date.now) {
                            Text(notification.id)
                        } else {
                            Text("Occurred: \(notification.id)")
                        }
                    }
                }
            }.onReceive(timer) { input in
                showNotifications = false
                showNotifications = true
            }
        }
        .padding()
        .navigationTitle("Notifications Dev")
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

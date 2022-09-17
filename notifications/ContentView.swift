//
//  ContentView.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/16/22.
//

import SwiftUI

struct ContentView: View {
    @State var notificationDelayTime: Double = 5
    @State var enableUpcomingNotification: Bool = true
    @State var title = ""
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
                HandleFormSubmission(eventTitle: title, delayTime: notificationDelayTime, enableUpcoming: enableUpcomingNotification)
                title = ""
                enableUpcomingNotification = true
                notificationDelayTime = 5
            }, label: {
                Text("Schedule")
            })
        }
        .padding()
        .navigationTitle("Notifications")
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

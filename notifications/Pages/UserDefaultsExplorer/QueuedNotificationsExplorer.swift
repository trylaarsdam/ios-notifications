//
//  QueuedNotificationsExplorer.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/29/22.
//

import SwiftUI
import RecurringDateManager
import UniformTypeIdentifiers

struct QueuedNotificationsExplorer: View {
    @State private var showToast = false
    
    var body: some View {
        VStack{
            List {
                ForEach(getQueuedNotifications().sorted(by: { $0.date.compare($1.date) == .orderedAscending })) { notification in
                    VStack(alignment: .leading) {
                        Text("Date: \(notification.date.ISO8601Format())").bold()
                        Divider()
                        Text("Event: \n\(notification.eventID)").font(.footnote)
                        Text("ID: \n\(notification.id)").font(.footnote)
                        Text("Interval: \(notification.interval.rawValue)").font(.footnote)
                    }.frame(maxWidth: .infinity, alignment: .leading).multilineTextAlignment(.leading).onTapGesture {
                        UIPasteboard.general.setValue(String(describing: notification),
                                    forPasteboardType: UTType.plainText.identifier)
                    }
                }
            }
        }.navigationTitle("Queued Notifications")
            .multilineTextAlignment(.leading)
    }
}

//struct QueuedNotificationsExplorer_Previews: PreviewProvider {
//    static var previews: some View {
//        QueuedNotificationsExplorer()
//    }
//}

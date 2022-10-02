//
//  EventEditor.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/30/22.
//

import SwiftUI
import RecurringDateManager

struct EventEditor: View {
    var event: RecurringEvent
    let dateManager = RecurringDateManager()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        List {
            Section ("Controls") {
                Button("Delete Event") {
                    dateManager.deleteEvent(id: event.id)
                    presentationMode.wrappedValue.dismiss()
                }.foregroundColor(.red)
            }
            Section ("Event ID"){
                Text(event.id)
            }
            Section ("Event Date") {
                Text(event.date.ISO8601Format())
            }
            Section ("Event Intervals") {
                ForEach(event.enabledIntervals, id: \.self) { interval in
                    Text(interval.rawValue)
                }
            }
            Section("Scheduled Notifications") {
                ForEach(dateManager.getNotificationsOfEvent(id: event.id)) { notification in
                    Text("\(notification.interval.rawValue) - \(notification.date.ISO8601Format())")
                }
            }
        }.navigationTitle(event.name)
    }
}

//struct EventEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        EventEditor()
//    }
//}

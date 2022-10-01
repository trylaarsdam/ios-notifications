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
    
    var body: some View {
        List {
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
                
            }
        }.navigationTitle(event.name)
    }
}

//struct EventEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        EventEditor()
//    }
//}

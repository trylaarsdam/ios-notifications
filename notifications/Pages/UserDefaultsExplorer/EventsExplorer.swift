//
//  EventsExplorer.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/29/22.
//

import SwiftUI
import RecurringDateManager

struct EventsExplorer: View {
    private var dateManager = RecurringDateManager()
    @State var eventList = [RecurringEvent]()
    var body: some View {
        VStack {
            List {
                ForEach(eventList) { event in
                    NavigationLink {
                        EventEditor(event: event)
                    } label: {
                        HStack (alignment: .center){
                            VStack (alignment: .leading){
                                Text("\(event.name)").bold()
                                Text(event.date.ISO8601Format())
                            }.frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            Button("Create Event") {
                let _ = dateManager.createRecurringEvent(name: "Test Event 1", date: Date.now, enabledIntervals: [.second, .minute, .month])
                eventList = dateManager.getEvents()
            }
        }.navigationTitle("Events").onAppear {
            eventList = dateManager.getEvents()
        }
    }
}

//struct EventsExplorer_Previews: PreviewProvider {
//    static var previews: some View {
//        EventsExplorer()
//    }
//}

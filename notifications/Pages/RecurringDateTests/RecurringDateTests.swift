//
//  RecurringDateTests.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/28/22.
//

import SwiftUI
import RecurringDateManager

struct RecurringDateTests: View {
    var dateManager = RecurringDateManager()
    var body: some View {
        VStack {
            List {
                NavigationLink("Event List Demo", destination: EventListDemo())
                
            }
            Button("Seconds from now") {
                print(dateManager.createRecurringEvent(name: "Test Event 1", date: Date.now, enabledIntervals: [.second, .minute]))
            }
        }.navigationTitle("Recurring Date Tests").padding(.top)
    }
}

//struct RecurringDateTests_Previews: PreviewProvider {
//    static var previews: some View {
//        RecurringDateTests()
//    }
//}

//
//  EventListDemo.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/28/22.
//

import SwiftUI
import RecurringDateManager

struct EventListDemo: View {
    @State var selectedDate: Date = Date.now
    @State var selectedInterval = EventInterval.second
    private var dateManager = RecurringDateManager()
    
    var body: some View {
        VStack {
            Form {
                Section("Date Selection") {
                    DatePicker("Event Date", selection: $selectedDate)
                }
                Section ("Interval Selection"){
                    Picker("Available Intervals", selection: $selectedInterval) {
                        ForEach(EventInterval.allCases, id: \.self) { value in
                            Text(value.rawValue)
                                .tag(value)
                        }
                    }.pickerStyle(.inline).labelsHidden()
                }
                Section {
                    NavigationLink {
                        RecurringDateList(eventInterval: selectedInterval,
                                          dates: dateManager.calculateIntervals(interval: selectedInterval, date: selectedDate)
                        )
                    } label: {
                        Text("Generate Dates")
                    }
                }
            }
        }.navigationTitle("Event List Demo").padding(.top)
    }
}

//struct EventListDemo_Previews: PreviewProvider {
//    static var previews: some View {
//        EventListDemo()
//    }
//}

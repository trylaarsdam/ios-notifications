//
//  RecurringDateList.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/28/22.
//

import SwiftUI
import RecurringDateManager

struct RecurringDateList: View {
    var eventInterval: EventInterval
    var dates: [(Date, Int)]
    
    var body: some View {
        VStack {
            Text("Event Interval Unit: \(eventInterval.rawValue)")
            List {
                ForEach(dates, id:\.0) { item in
                    Text(item.0.ISO8601Format())
                }
            }
        }.navigationTitle("Generated Date List")
    }
}

//struct RecurringDateList_Previews: PreviewProvider {
//    static var previews: some View {
//        RecurringDateList()
//    }
//}

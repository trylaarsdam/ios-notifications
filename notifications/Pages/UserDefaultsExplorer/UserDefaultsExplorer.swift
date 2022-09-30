//
//  UserDefaultsExplorer.swift
//  notifications
//
//  Created by Todd Rylaarsdam on 9/29/22.
//

import SwiftUI

struct UserDefaultsExplorer: View {
    var body: some View {
        VStack {
            List {
                NavigationLink("Events", destination: EventsExplorer())
                NavigationLink("Queued Notifications", destination: QueuedNotificationsExplorer())
            }
        }.navigationTitle("UserDefaults Explorer")
    }
}

//struct UserDefaultsExplorer_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDefaultsExplorer()
//    }
//}

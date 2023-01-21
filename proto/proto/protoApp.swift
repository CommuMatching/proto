//
//  protoApp.swift
//  proto
//
//  Created by 玉川悠真 on 2023/01/22.
//

import SwiftUI

@main
struct protoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

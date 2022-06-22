//
//  PINFOApp.swift
//  PINFO
//
//  Created by Thrace on 4/25/22.
//

import SwiftUI

@main
struct PINFOApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

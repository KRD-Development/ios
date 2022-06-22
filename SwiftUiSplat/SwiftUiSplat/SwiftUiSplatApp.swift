//
//  SwiftUiSplatApp.swift
//  SwiftUiSplat
//
//  Created by Thrace on 5/1/22.
//

import SwiftUI

@main
struct SwiftUiSplatApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

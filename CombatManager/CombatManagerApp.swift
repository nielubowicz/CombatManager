//
//  CombatManagerApp.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import SwiftUI
import SwiftData

@main
struct CombatManagerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Armor.self,
            Encounter.self,
            HitPoints.self,
            InitiativeOrder.self,
            PlayerCharacter.self,
            Saves.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

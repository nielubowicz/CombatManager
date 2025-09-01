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
// ******* ******* ******* ******* *******

// TODO: Add DocumentGroup support for the ability to share encounters
// TODO: Consider giving each encounter (??) a model container
// TODO: Figure out how to display an individual record via a property-wrapper or similar
// TODO: Change CombatEncounter display into a grid

// ******* ******* ******* ******* *******

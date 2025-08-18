//
//  SampleData.swift
//  CombatManager
//
//  Created by mac on 8/17/25.
//


import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()


    let modelContainer: ModelContainer


    var context: ModelContext {
        modelContainer.mainContext
    }

    private init() {
        let schema = Schema([
            Armor.self,
            Encounter.self,
            HitPoints.self,
            InitiativeOrder.self,
            PlayerCharacter.self,
            Saves.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)


        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])


            insertSampleData()


            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }


    private func insertSampleData() {
        for character in [PlayerCharacter.mock(), PlayerCharacter.mock(), PlayerCharacter.mock()] {
            context.insert(character)
        }
        
        let encounter = Encounter.mock()
        context.insert(encounter)
    }
}

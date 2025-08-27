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
    
    public struct EncounterNames {
        static let base = "Encounter"
        static let contested = "Contested Initiative Encounter"
    }
    
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
        context.insert(PlayerCharacter.mock(name: "Abe the Able"))
        context.insert(PlayerCharacter.mock(name: "Billy the Bold"))
        context.insert(PlayerCharacter.mock(name: "Charles the Charming"))
        
        let encounter = Encounter.mock(name: EncounterNames.base)
        context.insert(encounter)
        
        let contestedEncounter = Encounter.mock(
            name: EncounterNames.contested,
            initiative: [
                InitiativeOrder.mock(
                    character: PlayerCharacter.mock(name: "Middle", saves: Saves(will: 10, fortitude: 10, reflex: 10)),
                    initiative: 10
                ),
                InitiativeOrder.mock(
                    character: PlayerCharacter.mock(
                        name: "Lasty",
                        saves: Saves(will: 10, fortitude: 10, reflex: 9)
                    ),
                    initiative: 10
                ),
                InitiativeOrder.mock(
                    character: PlayerCharacter.mock(
                        name: "Firsty",
                        saves: Saves(will: 10, fortitude: 10, reflex: 12)
                    ),
                    initiative: 10
                )]
        )
        context.insert(contestedEncounter)
    }
}

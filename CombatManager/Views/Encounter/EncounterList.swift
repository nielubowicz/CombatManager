//
//  EncounterList.swift
//  CombatManager
//
//  Created by mac on 8/18/25.
//

import SwiftUI
import SwiftData

struct EncounterList: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var encounters: [Encounter]
    
    var body: some View {
        NavigationStack {
            List(encounters) { encounter in
                NavigationLink {
                    CombatEncounter(encounter: encounter)
                } label: {
                    HStack {
                        Text(encounter.name)
                            .font(.headline)
                        Text(encounter.initiative.prefix(3).map{ $0.character.name }.joined(separator: ", "))
                    }
                }
            }
        }
    }
}

#Preview {
    EncounterList()
        .modelContainer(SampleData.shared.modelContainer)
}

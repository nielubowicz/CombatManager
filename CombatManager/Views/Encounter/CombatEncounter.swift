//
//  CombatEncounter.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import SwiftUI
import SwiftData

struct CombatEncounter: View {
    @Environment(\.modelContext) var modelContext
    
    @Binding var encounter: Encounter
    
    var body: some View {
        List {
            ForEach(encounter.initiative.sorted(by: >)) { initiativeOrder in
                HStack {
                    Text(initiativeOrder.initiative, format: .number)
                        .font(.title)
                        .glassEffect()
                    CondensedCharacterView(character: initiativeOrder.character)
                }
            }
            .onMove { from, to in
                print("Move \(from) to \(to)")
            }
        }
        .navigationTitle(encounter.name)
        // TODO: Should have an advance button, with current initiative at the top
        // TODO: Fix display into a grid ?
    }
}

#Preview {
    CombatEncounter(encounter: .constant(Encounter.mock()))
        .modelContainer(SampleData.shared.modelContainer)
}

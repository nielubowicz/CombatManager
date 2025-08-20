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
    
    @StateObject var viewModel: CombatEncounterViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.currentInitiativeOrder) { initiativeOrder in
                HStack {
                    Text(initiativeOrder.initiative, format: .number)
                        .font(.title)
                        .glassEffect()
                    CondensedCharacterView(character: initiativeOrder.character)
                }
            }
            // TODO: Support moving manually??
            // I'm not sure there's a need, unless someone holds their turn
            // oh yes that's the use case for it.
            // TODO: Definitely support moving manually
//            .onMove { from, to in
//                print("Move \(from) to \(to)")
//            }
        }
        .navigationTitle(viewModel.title)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button {
                    withAnimation {
                        viewModel.rollbackInitiative()
                    }
                } label: {
                    Text("Previous")
                        .padding()
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Button {
                    withAnimation {
                        viewModel.advanceInitiative()
                    }
                } label: {
                    Text("Next")
                        .padding()
                }
            }
        }
        // TODO: Fix display into a grid ?
    }
}

#Preview {
    CombatEncounter(
        viewModel: CombatEncounterViewModel(encounter: Encounter.mock())
    )
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("contested initiative") {
    CombatEncounter(
        viewModel: CombatEncounterViewModel(
            encounter: Encounter.mock(
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
        )
    )
    .modelContainer(SampleData.shared.modelContainer)
}

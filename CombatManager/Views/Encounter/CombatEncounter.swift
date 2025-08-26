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
            .onMove { from, to in
                viewModel.encounter.initiative[from.first!].initiative = viewModel.encounter.initiative[to].initiative - 1
                do {
                    try modelContext.save()
                } catch {
                    print(error)
                }
            }
        }
        .navigationTitle(viewModel.title)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                EditButton()
            }
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
    let context = SampleData.shared.modelContainer.mainContext
    let predicate = #Predicate<Encounter> { $0.name == "Encounter" }
    let descriptor = FetchDescriptor(predicate: predicate)
    let encounters = try! context.fetch(descriptor)
    CombatEncounter(
        viewModel: CombatEncounterViewModel(encounter: encounters.first!)
    )
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("contested initiative") {
    let context = SampleData.shared.modelContainer.mainContext
    let encounters = try! context.fetch(
        FetchDescriptor(predicate: #Predicate<Encounter> { $0.name == "Contested Initiative Encounter" })
    )
    CombatEncounter(
        viewModel: CombatEncounterViewModel(encounter: encounters.first!)
    )
    .modelContainer(SampleData.shared.modelContainer)
}

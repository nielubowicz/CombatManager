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
    
    @Bindable var encounter: Encounter
    @ObservedObject private var viewModel: CombatEncounterViewModel
    
    init(encounter: Encounter) {
        self.encounter = encounter
        self.viewModel = CombatEncounterViewModel(encounter: encounter)
    }
    
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
                /*
                 TODO: Figure out how to solve the case where pushing initiative causes
                    a conflict at the new (destination.initiative - 1) point
                 */
                print(viewModel.encounter.initiative.map { $0.character.name })
                viewModel.moveInitiative(from.first!, toPosition: to - 1)
                print(viewModel.encounter.initiative.map { $0.character.name })
                do {
                    try modelContext.save()
                } catch {
                    print(error)
                }
            }
        }
        .navigationTitle(viewModel.encounter.name)
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
        .task {
            viewModel.updateInitiativeOrder()
        }
    }
}

#Preview {
    let context = SampleData.shared.modelContainer.mainContext
    let predicate = #Predicate<Encounter> { $0.name == "Encounter" }
    let descriptor = FetchDescriptor(predicate: predicate)
    let encounters = try! context.fetch(descriptor)
    CombatEncounter(encounter: encounters.first!)
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("contested initiative") {
    let context = SampleData.shared.modelContainer.mainContext
    let predicate = #Predicate<Encounter> { $0.name == "Contested Initiative Encounter" }
    let descriptor = FetchDescriptor(predicate: predicate)
    let encounters = try! context.fetch(descriptor)
    CombatEncounter(encounter: encounters.first!)
        .modelContainer(SampleData.shared.modelContainer)
}

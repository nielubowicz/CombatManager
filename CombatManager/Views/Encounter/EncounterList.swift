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
    @State var selectedEncounters = Set<Encounter>()
    @State var selectedEncounter: Encounter? = nil
    
    var body: some View {
        NavigationSplitView {
            List(encounters, id: \.self, selection: $selectedEncounters) { encounter in
                VStack(alignment: .leading) {
                    Text(encounter.name)
                        .font(.headline)
                    Text(encounter.unwrappedInitiative.prefix(3).map{ $0.unwrappedCharacter.name }.joined(separator: ", "))
                        .font(.caption)
                }
            }
            .listStyle(.sidebar)
        } detail: {
            if let encounter = selectedEncounters.first {
                CombatEncounter(encounter: encounter)
            } else {
                ContentUnavailableView("Select an Encounter", image: "magnifying.glass")
            }
        }
        .navigationTitle("Encounters")
    }
}

#Preview {
    EncounterList()
        .modelContainer(SampleData.shared.modelContainer)
}

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
        List(encounters) { encounter in
            HStack {
                Text(encounter.name)
                Text(encounter.initiative.sorted(by: >).prefix(3).map{ $0.character.name }.joined(separator: ", "))
            }
        }
    }
}

#Preview {
    EncounterList()
        .modelContext(SampleData.shared.context)
}

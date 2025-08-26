//
//  CombatEncounterViewModel.swift
//  CombatManager
//
//  Created by mac on 8/20/25.
//

import SwiftUI
import Combine

class CombatEncounterViewModel: ObservableObject {
    @Environment(\.modelContext) var modelContext
    
    var encounter: Encounter
    @Published var currentIndex = 0
    
    init(encounter: Encounter, currentIndex: Int = 0) {
        self.encounter = encounter
        self.currentIndex = currentIndex
    }
    
    var title: String {
        encounter.name
    }
    
    var currentInitiativeOrder: [InitiativeOrder] {
        let sorted = encounter.initiative.sorted(by: >)
        return Array(sorted[currentIndex..<sorted.count] + sorted[0..<currentIndex])
    }
    
    func advanceInitiative() {
        currentIndex = (currentIndex + 1) % encounter.initiative.count
    }
    
    func rollbackInitiative() {
        currentIndex = (currentIndex - 1 >= 0 ? currentIndex - 1 : encounter.initiative.count - 1)
    }
}

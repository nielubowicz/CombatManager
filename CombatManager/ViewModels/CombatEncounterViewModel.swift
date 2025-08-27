//
//  CombatEncounterViewModel.swift
//  CombatManager
//
//  Created by mac on 8/26/25.
//

import Combine
import SwiftUI

class CombatEncounterViewModel: ObservableObject {
    @Bindable var encounter: Encounter
    @Published var currentInitiativeOrder: [InitiativeOrder]
    
    init(encounter: Encounter) {
        self.encounter = encounter
        self.currentInitiativeOrder = encounter.initiative
    }
    
    func advanceInitiative() {
        encounter.currentIndex = (encounter.currentIndex + 1) % encounter.initiative.count
        updateInitiativeOrder()
    }
    
    func rollbackInitiative() {
        encounter.currentIndex = (encounter.currentIndex - 1 >= 0 ? encounter.currentIndex - 1 : encounter.initiative.count - 1)
        updateInitiativeOrder()
    }
    
    func moveInitiative(_ from: Int, toPosition: Int) {
        guard from < encounter.initiative.count && toPosition < encounter.initiative.count else { return }
        
        encounter.initiative[from].initiative = encounter.initiative[toPosition].initiative - 1
        updateInitiativeOrder()
    }
    
    func updateInitiativeOrder() {
        let sorted = encounter.initiative.sorted(by: >)
        encounter.initiative = Array(sorted[encounter.currentIndex..<sorted.count] + sorted[0..<encounter.currentIndex])
        currentInitiativeOrder = encounter.initiative
    }
}

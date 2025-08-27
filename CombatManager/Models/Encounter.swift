//
//  Encounter.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import SwiftData

@Model
final class Encounter {
    @Attribute(.unique) var name: String
    var initiative: [InitiativeOrder] = []
    var currentIndex = 0
    
    init(name: String, initiative: [InitiativeOrder], currentIndex: Int = 0) {
        self.name = name
        self.initiative = initiative
        self.currentIndex = currentIndex
    }
}

extension Encounter: Previewable {
    static func mock(
        name: String = "Battle of Helm's Deep",
        initiative: [InitiativeOrder] = [
            InitiativeOrder.mock(
                character: PlayerCharacter.mock(name: "Ablin the Goblin"),
                initiative: 15
            ),
            InitiativeOrder.mock(
                character: PlayerCharacter.mock(name: "Coblin the Goblin"),
                initiative: 12
            ),
            InitiativeOrder.mock(
                character: PlayerCharacter.mock(name: "Boblin the Goblin"),
                initiative: 14
            ),
            InitiativeOrder.mock(
                character: PlayerCharacter.mock(name: "Dablin the Goblin"),
                initiative: 10
            ),
        ],
        currentIndex: Int = 0
    ) -> Encounter {
        Encounter(
            name: name,
            initiative: initiative,
            currentIndex: 0
        )
    }
}

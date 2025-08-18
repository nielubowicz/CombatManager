//
//  InitiativeOrder.swift
//  CombatManager
//
//  Created by mac on 8/17/25.
//

import SwiftData

@Model
final class InitiativeOrder {
    var character: PlayerCharacter
    var initiative: Int
    
    init(character: PlayerCharacter, initiative: Int) {
        self.character = character
        self.initiative = initiative
    }
}

extension InitiativeOrder: Comparable {
    static func < (lhs: InitiativeOrder, rhs: InitiativeOrder) -> Bool {
        lhs.initiative < rhs.initiative
    }
}

extension InitiativeOrder: Previewable {
    static func mock(
        character: PlayerCharacter = PlayerCharacter.mock(),
        initiative: Int = 10
    ) -> InitiativeOrder {
        InitiativeOrder(
            character: character,
            initiative: initiative
        )
    }
}

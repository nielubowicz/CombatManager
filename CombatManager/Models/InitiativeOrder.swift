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
        // Initiative order is determined first by Initiative score (lhs < rhs)
        // and then, if the scores are equal, comparing the DEX modifier (lhs < rhs)
        // [here, Reflex save is used as a stand-in for DEX until such time
        // as PlayerCharacter's contain attribute scores.]
        // NOTE: The official 5e rules say that players should decide how to break
        // initiative ties between players, GM to decide between GM-controlled characters,
        // and GM decides between player and GM-controlled characters.
        // In this case, it may be easier to just adjust the initiative score per character!
        lhs.initiative < rhs.initiative ||
        (lhs.initiative == rhs.initiative ? lhs.character.saves.reflex < rhs.character.saves.reflex : false)
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

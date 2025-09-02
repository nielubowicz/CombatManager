//
//  Armor.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import SwiftData

@Model
final class Armor {
    var AC: Int = 10
    
    @Relationship(inverse: \PlayerCharacter.armor) var player: PlayerCharacter?
    
    init(AC: Int) {
        self.AC = AC
    }
}

extension Armor: Previewable {
    static func mock(
        AC: Int = 10
    ) -> Armor {
        Armor(AC: AC)
    }
}

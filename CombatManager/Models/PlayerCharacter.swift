//
//  Character.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import Foundation
import SwiftUI
import SwiftData

struct Note: Codable, Hashable {
    let content: String
}

@Model
final class PlayerCharacter {
    var name: String = "Sam Snorkel"
    var health: HitPoints?
    var armor: Armor?
    var saves: Saves?
    var notes = [Note]()
    
    @Relationship(inverse: \InitiativeOrder.character) var initiativeOrders: [InitiativeOrder]?
    
    init(
        name: String,
        health: HitPoints,
        armor: Armor,
        saves: Saves,
        notes: [String]
    ) {
        self.name = name
        self.health = health
        self.armor = armor
        self.saves = saves
        self.notes = notes.map { Note(content: $0) }
    }
    
    var unwrappedHealth: HitPoints {
        health ?? HitPoints.mock()
    }
    
    var unwrappedArmor: Armor {
        armor ?? Armor.mock()
    }
    
    var unwrappedSave: Saves {
        saves ?? Saves.mock()
    }
}

extension PlayerCharacter: Previewable {
    static func mock(
        name: String = "Boblin the Goblin",
        health: HitPoints = HitPoints.mock(),
        armor: Armor = Armor.mock(),
        saves: Saves = Saves.mock(),
        notes: [String] = ["This is a test character", "Is Blessed"]
    ) -> PlayerCharacter {
        PlayerCharacter(
            name: name,
            health: health,
            armor: armor,
            saves: saves,
            notes: notes
        )
    }
}

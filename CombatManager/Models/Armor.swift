//
//  Armor.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import SwiftData

@Model
final class Armor {
    var AC: Int
    
    init(AC: Int) {
        self.AC = AC
    }
}

extension Armor: Previewable {
    static func mock(
        AC: Int = 13
    ) -> Armor {
        Armor(AC: AC)
    }
}

//
//  Saves.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import SwiftData

@Model
final class Saves {
    var will: Int
    var fortitude: Int
    var reflex: Int
    
//    @Relationship(deleteRule: .cascade)
    
    init(will: Int, fortitude: Int, reflex: Int) {
        self.will = will
        self.fortitude = fortitude
        self.reflex = reflex
    }
}

extension Saves: Previewable {
    static func mock(
        will: Int = 10,
        fortitude: Int = 10,
        reflex: Int = 10
    ) -> Saves {
        Saves(will: will, fortitude: fortitude, reflex: reflex)
    }
}

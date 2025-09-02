//
//  HitPoints.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import SwiftData

@Model
final class HitPoints {
    var current: Int = 10
    var max: Int = 10
    var temporary: Int = 10
    
    @Relationship(inverse: \PlayerCharacter.health) var player: PlayerCharacter?
    
    init(current: Int, max: Int, temporary: Int) {
        self.current = current
        self.max = max
        self.temporary = temporary
    }
}


extension HitPoints: Previewable {
    static func mock(
        current: Int = 15,
        max: Int = 30,
        temporary: Int = 0
    ) -> HitPoints {
        HitPoints(current: current, max: max, temporary: temporary)
    }
}

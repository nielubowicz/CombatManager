//
//  HitPoints.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import SwiftData

@Model
final class HitPoints {
    var current: Int
    var max: Int
    var temporary: Int
    
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

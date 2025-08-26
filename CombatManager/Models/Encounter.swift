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

    init(name: String, initiative: [InitiativeOrder]) {
        self.name = name
        self.initiative = initiative
    }
}

extension Encounter: Previewable {
    static func mock(
        name: String = "Battle of Helm's Deep",
        initiative: [InitiativeOrder] = [InitiativeOrder.mock(initiative: 12), InitiativeOrder.mock(initiative: 15), InitiativeOrder.mock(initiative: 14), InitiativeOrder.mock(initiative: 10)]
    ) -> Encounter {
        Encounter(
            name: name,
            initiative: initiative
        )
    }
}

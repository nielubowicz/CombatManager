//
//  CharacterList.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import SwiftUI
import SwiftData

struct CharacterList: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var characters: [PlayerCharacter]
    
    var body: some View {
        List(characters) { character in
            Text(character.name)
        }
    }
}

#Preview {
    CharacterList()
        .modelContainer(SampleData.shared.modelContainer)
}

//
//  ContentView.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
            Text("Select an item")
    }
}

#Preview {
    ContentView()
        .modelContainer(for: PlayerCharacter.self, inMemory: true)
}

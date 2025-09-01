//
//  CondensedCharacterView.swift
//  CombatManager
//
//  Created by mac on 8/13/25.
//

import SwiftUI

struct CondensedCharacterView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State var character: PlayerCharacter
    @State var showStatuses: Bool = false
    
    @Namespace private var namespace
    
    var body: some View {
        Button {
            showStatuses.toggle()
        } label: {
            VStack {
                HStack {
                    Image(systemName: "cat")
                        .padding(24)
                        .glassEffect()
                    
                    Text(character.name)
                        .font(.title)
                        .padding()
                }
                Spacer()
                
                HStack {
                    GlassEffectContainer {
                        Button {
                            
                        } label: {
                            Text(character.health.current, format: .number)
                                .padding()
                        }
                        .buttonStyle(.glass)
                        Button {
                            
                        } label: {
                            Text(character.health.max, format: .number)
                                .padding()
                        }
                        .buttonStyle(.glass)
                    }
                    .glassEffectUnion(id: 1, namespace: namespace)
                    Spacer()
                    saves
                    Spacer()
                    Button {
                        
                    } label: {
                        Text(character.armor.AC, format: .number)
                            .padding()
                            .overlay(alignment: .topTrailing) {
                                Image(systemName: "shield")
                            }
                    }
                    .buttonStyle(.glass)
                }
                
                statusList
            }
            .padding()
            .clipShape(.rect(cornerRadius: 24))
            .overlay {
                ConcentricRectangle()
                    .stroke(.red, style: StrokeStyle(lineWidth: 4))
            }
            .padding()
        }

    }
    
    @ViewBuilder
    private var statusList: some View {
        if showStatuses {
            Spacer()
            
            List(character.notes, id: \.self) { note in
                Text(note)
            }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "pencil.tip.crop.circle.badge.plus")
                        .padding()
                }
            }
        }
    }
    
    @ViewBuilder
    private var saves: some View {
        GlassEffectContainer(spacing: 44) {
            Button {
                
            } label: {
                Text(character.saves.will, format: .number)
                    .padding()
                    .overlay(alignment: .topTrailing) {
                        Image(systemName: "brain")
                    }
            }
            Button {
                
            } label: {
                Text(character.saves.fortitude, format: .number)
                    .padding()
                    .overlay(alignment: .topTrailing) {
                        Image(systemName: "shield.slash")
                    }
            }
            Button {
                
            } label: {
                Text(character.saves.reflex, format: .number)
                    .padding()
                    .overlay(alignment: .topTrailing) {
                        Image(systemName: "wind")
                    }
            }
        }
        .buttonStyle(.glass)
        
    }
    
}

#Preview {
    CondensedCharacterView(character: PlayerCharacter.mock())
        .frame(maxHeight: 480)
}

#Preview("Grid", traits: .landscapeLeft) {
    Grid {
        GridRow {
            CondensedCharacterView(character: PlayerCharacter.mock())
                .frame(maxHeight: 480)
            CondensedCharacterView(character: PlayerCharacter.mock())
                .frame(maxHeight: 480)
            CondensedCharacterView(character: PlayerCharacter.mock())
                .frame(maxHeight: 480)
        }
        GridRow {
            CondensedCharacterView(character: PlayerCharacter.mock())
                .frame(maxHeight: 480)
            CondensedCharacterView(character: PlayerCharacter.mock())
                .frame(maxHeight: 480)
            CondensedCharacterView(character: PlayerCharacter.mock())
                .frame(maxHeight: 480)
        }
        GridRow {
            CondensedCharacterView(character: PlayerCharacter.mock())
                .frame(maxHeight: 480)
            CondensedCharacterView(character: PlayerCharacter.mock())
                .frame(maxHeight: 480)
            CondensedCharacterView(character: PlayerCharacter.mock())
                .frame(maxHeight: 480)
        }
    }
}

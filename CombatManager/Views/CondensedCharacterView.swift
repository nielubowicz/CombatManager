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
    
    var body: some View {
        VStack {
            HStack {
                //            Image()
                //                .padding(24)
                //                .glassEffect()
                            
                Text(character.name)
                    .font(.title)
            }
            Spacer()
            
            HStack {
                HStack {
                    Button {
                        
                    } label: {
                        Text(character.health.current, format: .number)
                    }
                    Button {
                        
                    } label: {
                        Text(character.health.max, format: .number)
                    }
                }
                .padding()
                .overlay(alignment: .topTrailing) {
                    Image(systemName: "heart")
                }
                Spacer()
                HStack {
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
                Spacer()
                Button {
                    
                } label: {
                    Text(character.armor.AC, format: .number)
                        .padding()
                        .overlay(alignment: .topTrailing) {
                            Image(systemName: "shield")
                        }
                }
            }
            
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
        .padding()
        .clipShape(.rect(cornerRadius: 24))
        .overlay {
            ConcentricRectangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 4))
        }
        .padding()
        
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

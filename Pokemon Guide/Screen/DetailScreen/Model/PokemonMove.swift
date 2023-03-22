//
//  PokemonMove.swift
//  Pokemon Guide
//
//  Created by Ali Berkay BERBER on 22.03.2023.
//

import Foundation

// MARK: - PokemonMove
struct PokemonMove: Codable {
    let accuracy, id: Int
    let name: String
    let power, pp: Int
}

//
//  DetailScreenModel.swift
//  Pokemon Guide
//
//  Created by Ali Berkay BERBER on 21.03.2023.
//

import Foundation

struct PokemonDetailResponse: Codable {
    let id: Int
    let moves: [Move]
    let name: String
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
}

struct Move: Codable {
    let move: MoveElement
}

struct MoveElement: Codable {
    let name: String
    let url: String
}

struct StatClass: Codable {
    let name: String
}

struct Sprites: Codable {
    let other: Other
}

struct Other: Codable {
    let home: Home
}

struct Home: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct Stat: Codable {
    let baseStat: Int
    let stat: OnlyName
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}

struct TypeElement: Codable {
    let slot: Int
    let type: OnlyName
}

struct OnlyName: Codable {
    let name: String
}

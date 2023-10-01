//
//  GetPokemonResponse.swift
//  PokemonApp
//
//  Created by Carlos Obregon on 29/09/23.
//

import Foundation

struct GetPokemonResponse: Codable {
    let name: String
    let base_experience: Int
    let abilities: [Ability]
    let sprites: FrontImage
}

struct abilityInfo: Codable {
    let name: String
}

struct Ability: Codable {
    let ability: abilityInfo
}

struct FrontImage: Codable {
    let front_default: String
}

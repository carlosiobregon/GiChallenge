//
//  MainViewModel.swift
//  PokemonApp
//
//  Created by Carlos Obregon on 29/09/23.
//

import Foundation
import Combine

class MainViewModel: NSObject {
    
    var name = String()
    var urlImage = String()
    @Published var abilities = [String]()
    @Published var experience: Int = 0

    public func fetchPokemon() {
        Service.shared.execute(pokemonPath: "25", expecting: PokemonInfo.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.updateModel(model: data)
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlImage)  else {
            completion(.failure(URLError(.badURL)))
            return
        }
        ImageLoader.shared.downloadImage(url, completion: completion)
    }
    
    private func updateModel(model: PokemonInfo) {
        self.name = model.name
        self.urlImage = model.imageUrl
        self.abilities = model.abilities
        self.experience = model.experience
    }
    
    public func increaseExperience() {
        experience += 1
    }
    
    public func decreaseExperience() {
        experience -= 1
    }
}

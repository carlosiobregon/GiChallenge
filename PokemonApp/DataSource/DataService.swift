//
//  DataService.swift
//  PokemonApp
//
//  Created by Carlos Obregon on 29/09/23.
//

import Foundation
import Alamofire


final class Service {

    static let shared = Service()

    /// Privatized constructor
    private init() {}
    
    private let apiManager = APIManager()

    /// Error types
    enum ServiceError: Error {
        case failedToCreateRequest
        case failedRequest
        case failedToGetData
    }

    /// Send Pokemon API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T>(
        pokemonPath: String,
        expecting type: T.Type,
        completion: @escaping (Result<PokemonInfo, ServiceError>) -> Void
    ) {

        let request = Request(endpoint: .pokemon, pathComponents: [pokemonPath])
        
        apiManager.getRequest(request.urlString) { (result: Result<GetPokemonResponse, AFError>) in
            switch result {
            case .success(let data):
                let pokemon = PokemonInfo(name: data.name, experience: data.base_experience, abilities: data.abilities.map{$0.ability.name}, sprites: data.sprites.front_default)
                completion(.success(pokemon))
                print(data)
            case .failure(let error):
                completion(.failure(ServiceError.failedRequest))
                print(error)
            }
        }
    }


}

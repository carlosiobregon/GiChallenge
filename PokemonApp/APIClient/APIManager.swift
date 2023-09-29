//
//  APIManager.swift
//  PokemonApp
//
//  Created by Carlos Obregon on 29/09/23.
//

import Alamofire

class APIManager {
    
    static let shared: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // Tiempo de espera en segundos
        configuration.timeoutIntervalForResource = 30
        return Session(configuration: configuration)
    }()


    func getRequest<T: Decodable>(_ url: URLConvertible, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, completion: @escaping (Result<T, AFError>) -> Void) {
        APIManager.shared.request(url, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: T.self) { response in
                completion(response.result)
            }
    }

}


//
//  Request.swift
//  PokemonApp
//
//  Created by Carlos Obregon on 29/09/23.
//

import Foundation

/// Object that represents a singlet API call
final class Request {
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://pokeapi.co/api/v2"
    }

    /// Desired endpoint
    let endpoint: Endpoint

    /// Path components for API, if any
    private let pathComponents: [String]


    /// Constructed url for the api request in string format
    public var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue

        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }

        return string
    }

    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }


    // MARK: - Public

    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of Path components
    public init(
        endpoint: Endpoint,
        pathComponents: [String] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
    }

}

// MARK: - Request convenience
extension Request {
    static let pokemonInfoRequests = Request(endpoint: .pokemon)
}


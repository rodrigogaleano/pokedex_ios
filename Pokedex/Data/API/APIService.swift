//
//  APIService.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import Foundation

final class APIService {
    private let baseURL = "https://pokeapi.co/api/v2"
    
    func get<T: Decodable>(path: String) async throws -> T {
        guard let url = URL(string: baseURL + path) else { throw URLError(.badURL) }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}

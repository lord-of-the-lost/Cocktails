//
//  NetworkService.swift
//  Cocktails
//
//  Created by Николай Игнатов on 25.02.2025.
//

import Foundation

// MARK: - NetworkServiceProtocol
protocol NetworkServiceProtocol {
    func fetchData(parameters: CocktailQueryParameters, completion: @escaping (Result<[CocktailModel], Error>) -> Void)
}

// MARK: - NetworkError
enum NetworkError: Error {
    case badURL, missingParameters, badResponse, invalidData, decodeError
}

// MARK: - NetworkService
final class NetworkService: NetworkServiceProtocol {
    private let baseURL = "https://api.api-ninjas.com"
    
    func fetchData(parameters: CocktailQueryParameters, completion: @escaping (Result<[CocktailModel], Error>) -> Void) {
        guard parameters.name != nil || parameters.ingredients != nil else {
            completion(.failure(NetworkError.missingParameters))
            return
        }
        
        guard var components = URLComponents(string: "\(baseURL)/v1/cocktail") else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        components.queryItems = parameters.toQueryItems()
        
        guard let url = components.url else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("GjzH6TPla1aQTHkwdGUczA==3XqJrf3rVQjP8stn", forHTTPHeaderField: "X-Api-Key")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let _ = error {
                completion(.failure(NetworkError.badResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let response = try JSONDecoder().decode([CocktailModel].self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(NetworkError.decodeError))
            }
        }.resume()
    }
}

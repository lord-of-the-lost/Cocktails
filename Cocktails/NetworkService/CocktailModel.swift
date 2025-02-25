//
//  CocktailModel.swift
//  Cocktails
//
//  Created by Николай Игнатов on 25.02.2025.
//

import Foundation

struct CocktailModel: Decodable {
    let ingredients: [String]
    let instructions: String
    let name: String
}

struct CocktailQueryParameters {
    let name: String?
    let ingredients: [String]?
    
    func toQueryItems() -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        
        if let name = name, !name.isEmpty {
            queryItems.append(URLQueryItem(name: "name", value: name))
        }
        
        if let ingredients = ingredients, !ingredients.isEmpty {
            let ingredientsValue = ingredients.joined(separator: ",")
            queryItems.append(URLQueryItem(name: "ingredients", value: ingredientsValue))
        }
        
        return queryItems
    }
}

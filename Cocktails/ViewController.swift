//
//  ViewController.swift
//  Cocktails
//
//  Created by Николай Игнатов on 24.02.2025.
//

import UIKit

final class ViewController: UIViewController {
    let networkService: NetworkServiceProtocol = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
//        
//        let nameParameters = CocktailQueryParameters(name: "bloody", ingredients: nil)
//        networkService.fetchData(parameters: nameParameters) { result in
//            switch result {
//            case .success(let cocktails):
//                print("Found cocktails: \(cocktails)")
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }

//        let ingredientsParameters = CocktailQueryParameters(name: nil, ingredients: ["vodka", "lemon juice"])
//        networkService.fetchData(parameters: ingredientsParameters) { result in
//            switch result {
//            case .success(let cocktails):
//                print("Found cocktails: \(cocktails)")
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
    }
}


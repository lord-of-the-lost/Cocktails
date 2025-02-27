//
//  ViewController.swift
//  Cocktails
//
//  Created by Николай Игнатов on 24.02.2025.
//

import UIKit

final class ViewController: UIViewController {
    let networkService: NetworkServiceProtocol = NetworkService()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Введите название коктейля"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

// MARK: - Private Methods
private extension ViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(searchBar)
    }
    
    func fetchData() {
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
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}



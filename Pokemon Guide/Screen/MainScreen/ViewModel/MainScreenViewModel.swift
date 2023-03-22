//
//  MainScreenViewModel.swift
//  Pokemon Guide
//
//  Created by Ali Berkay BERBER on 21.03.2023.
//

import Foundation

protocol PokemonViewModelProtocol {
    var urlString: String { get set }
    var bindPokemonData: ((PokemonResponse?) -> ())? {get set}
    func fetchDataPokemon()
}

class PokemonListViewModel: PokemonViewModelProtocol {
    
    private var apiService: ApiServiceProtocol?
    var data: PokemonResponse?
    
    var urlString: String
    var bindPokemonData: ((PokemonResponse?) -> ())?
    
    init(urlString: String, apiService: ApiServiceProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL(string: urlString) {
            self.apiService?.get(url: url)
        }
        fetchDataPokemon()
    }
    
    func fetchDataPokemon() {
        self.apiService?.loadPokemon(model: PokemonResponse.self, completion: { response in
            switch response {
            case .success(let success):
                self.bindPokemonData?(success)
            case .failure( _):
                self.bindPokemonData?(nil)
            }
        })
    }
}


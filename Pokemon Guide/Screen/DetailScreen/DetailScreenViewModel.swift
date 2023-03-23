//
//  DetailScreenViewModel.swift
//  Pokemon Guide
//
//  Created by Ali Berkay BERBER on 21.03.2023.
//

import Foundation

protocol PokemonDetailViewModelProtocol {
    var urlString: String { get set }
    var bindPokemonDetailData: ((PokemonDetailResponse?) -> ())? {get set}
    var bindPokemonMoveData: ((PokemonMove?) -> ())? {get set}
    func fetchDataPokemonDetail()
}

class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    private var apiService: ApiServiceProtocol?
    var data: PokemonDetailResponse?
    
    var urlString: String
    var bindPokemonDetailData: ((PokemonDetailResponse?) -> ())?
    var bindPokemonMoveData: ((PokemonMove?) -> ())?
    
    
    init(urlString: String, apiService: ApiServiceProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL(string: urlString) {
            self.apiService?.get(url: url)
        }
        fetchDataPokemonDetail()
        fetchDataMoveDetail()
    }
    
    func fetchDataPokemonDetail() {
        self.apiService?.loadPokemon(model: PokemonDetailResponse.self, completion: { response in
            switch response {
            case .success(let success):
                self.bindPokemonDetailData?(success)
            case .failure(_):
                self.bindPokemonDetailData?(nil)
            }
        })
    }
    
    func fetchDataMoveDetail() {
        self.apiService?.loadPokemon(model: PokemonMove.self, completion: { response in
            switch response {
            case .success(let success):
                self.bindPokemonMoveData?(success)
            case .failure(_):
                self.bindPokemonMoveData?(nil)
            }
        })
    }
     
}

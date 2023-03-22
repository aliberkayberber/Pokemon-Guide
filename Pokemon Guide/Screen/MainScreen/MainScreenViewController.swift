//
//  MainScreenViewController.swift
//  Pokemon Guide
//
//  Created by Ali Berkay BERBER on 21.03.2023.
//

import UIKit

class MainScreenViewController: UIViewController, UISearchResultsUpdating {

    private var viewModel: PokemonListViewModel?
    
    private var pokemon: PokemonResponse?
    
    let url = "https://pokeapi.co/api/v2/pokemon?&limit=40"
    var selectedPokemon: Pokemon?
    
    @IBOutlet private weak var pokemonTableView: UITableView! {
        didSet {
            pokemonTableView.delegate = self
            pokemonTableView.dataSource = self
            pokemonTableView.register(UINib(nibName: "MainScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "mainCell")
            pokemonTableView.rowHeight = 150.0
        }

        
    }
    fileprivate func setupViewModel() {
        viewModel = PokemonListViewModel(urlString: url , apiService: ApiService())
        
        viewModel?.bindPokemonData = { dataPokemon in
            if let dataPokemon = dataPokemon {
                self.pokemon = dataPokemon
            }
            DispatchQueue.main.async {
                self.pokemonTableView.reloadData()
            }
        }
    }
    
  //  let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
      //  let searchController = UISearchController(searchResultsController: nil)
        
       // navigationItem.searchController = searchController
        navigationController?.navigationBar.barTintColor = .green
        navigationController?.navigationBar.barStyle = .black
        
       // searchController.searchResultsUpdater = self
        setupViewModel()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
//MARK: - Tableview Func
extension MainScreenViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = self.pokemon?.results.count ?? 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as? MainScreenTableViewCell
        cell?.backgroundColor = .green
        cell?.configurePokemonCell(pokemon: pokemon?.results[indexPath.row], indexPath: indexPath)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "DetailScreenViewController") as? DetailScreenViewController
        else {
            return
        }
        viewController.selectedPokemon = pokemon?.results[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


//
//  DetailScreenViewController.swift
//  Pokemon Guide
//
//  Created by Ali Berkay BERBER on 21.03.2023.
//

import UIKit

class DetailScreenViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    @IBOutlet weak var detailTableView: UITableView! {
        didSet {
            detailTableView.delegate = self
            detailTableView.dataSource = self
            detailTableView.register(UINib(nibName: "DetailScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCell")
            detailTableView.rowHeight = 50.0
        }
    }
    var selectedPokemon: Pokemon?
    
    var viewModel: PokemonDetailViewModel?
    var pokemonUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedPokemon?.name.capitalized
        
        if let url = selectedPokemon?.url {
            self.pokemonUrl = url
        }
        
        self.viewModel = PokemonDetailViewModel(urlString: pokemonUrl, apiService: ApiService())
    }
    


}
//MARK: - TableView Func
extension DetailScreenViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        return cell
    }
    
    
}

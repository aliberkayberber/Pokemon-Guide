//
//  MainScreenViewController.swift
//  Pokemon Guide
//
//  Created by Ali Berkay BERBER on 21.03.2023.
//

import UIKit

class MainScreenViewController: UIViewController, UISearchResultsUpdating {

    

    @IBOutlet private weak var pokemonTableView: UITableView! {
        didSet {
            pokemonTableView.delegate = self
            pokemonTableView.dataSource = self
            pokemonTableView.register(UINib(nibName: "MainScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "mainCell")
            pokemonTableView.rowHeight = 150.0
        }

        
    }
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        let searchController = UISearchController(searchResultsController: nil)
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
//MARK: - Tableview Func
extension MainScreenViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as? MainScreenTableViewCell
        cell?.backgroundColor = .green
        return cell!
    }
    
    
}

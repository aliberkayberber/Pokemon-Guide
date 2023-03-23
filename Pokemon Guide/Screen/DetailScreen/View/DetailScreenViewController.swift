//
//  DetailScreenViewController.swift
//  Pokemon Guide
//
//  Created by Ali Berkay BERBER on 21.03.2023.
//

import UIKit

class DetailScreenViewController: UIViewController {

    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    
    @IBOutlet weak var topView: UIView!
    
    //@IBOutlet weak var horizontalStack: UIStackView!
    
    
    @IBOutlet weak var verticalStack: UIStackView!
    
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
    
    var pokemonSelectedDetail: PokemonDetailResponse?
    
    let pokemonStatsName = ["HP", "Attack", "Defense", "Sp.Atk", "Sp.Def", "Spd"]
    
    fileprivate func setupUITopView(forDistribution distribution: UIStackView.Distribution = .fillEqually, forSpacing spacing: CGFloat = 4) {
        verticalStack.distribution = distribution
        verticalStack.spacing = spacing
        topView.layer.cornerRadius = 16
        topView.layer.masksToBounds = true
    }
    
    fileprivate func bindingView()
    {
        self.viewModel?.bindPokemonDetailData = { dataPokemonDetail in
            if let dataPokemonDetail = dataPokemonDetail {
                self.pokemonSelectedDetail = dataPokemonDetail
            }
            DispatchQueue.main.async {
                self.detailTableView.reloadData()
            }
            
            self.pokemonImage.sd_setImage(with: URL(string: self.pokemonSelectedDetail?.sprites.other.home.frontDefault ?? ""))
            
            for i in 0..<(self.pokemonSelectedDetail?.stats.count ?? 0) {
                
                    let stackView = UIStackView()
                    stackView.alignment = .center
                    stackView.axis = .horizontal
                    stackView.distribution = .fill
                    stackView.contentMode = .scaleAspectFill
                    stackView.spacing = 4
                  
                
                    let statName = UILabel()
                    statName.text = self.pokemonStatsName[i]
                    statName.font = UIFont.systemFont(ofSize: 12, weight: .bold)
                    
                    let statCount = UILabel()
                    let pokemonStat = self.pokemonSelectedDetail?.stats[i].baseStat ?? 0
                    statCount.text = "\(pokemonStat)"
                    statCount.textAlignment = .right
                    statCount.font = UIFont.systemFont(ofSize: 12, weight: .medium)
                  
                    let progressView = UIProgressView(progressViewStyle: .bar)
                    progressView.center = self.verticalStack.center
                    progressView.setProgress(Float(pokemonStat) / 200.0, animated: true)
                    
                    stackView.addArrangedSubview(statName)
                    stackView.addArrangedSubview(statCount)
                    stackView.addArrangedSubview(progressView)
                    
                    statName.widthAnchor.constraint(equalToConstant: 64).isActive = true
                    statCount.widthAnchor.constraint(equalToConstant: 28).isActive = true
                    
                 
                                        statName.widthAnchor.constraint(equalToConstant: 64).isActive = true
                    self.verticalStack.addArrangedSubview(stackView)
                }
                
                for i in 0..<(self.pokemonSelectedDetail?.types.count ?? 0) {
                    let pokemonType = self.pokemonSelectedDetail?.types[i].type.name ?? ""

                }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedPokemon?.name.capitalized
        
        if let url = selectedPokemon?.url {
            self.pokemonUrl = url
        }
        
        self.viewModel = PokemonDetailViewModel(urlString: pokemonUrl, apiService: ApiService())
        
        bindingView()
    }
    


}
//MARK: - TableView Func
extension DetailScreenViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.pokemonSelectedDetail?.moves.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = detailTableView.dequeueReusableCell(withIdentifier: DetailScreenTableViewCell.identifier, for: indexPath) as? DetailScreenTableViewCell else { return UITableViewCell()}
        cell.abilitiesLabel.text = self.pokemonSelectedDetail?.moves[indexPath.row].move.name.capitalized
        cell.clipsToBounds = true
        cell.abilitiesLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        cell.configure(moveUrl: self.pokemonSelectedDetail?.moves[indexPath.row].move.url)
        return cell
    }
    
    
}

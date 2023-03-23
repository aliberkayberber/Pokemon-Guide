//
//  DetailScreenTableViewCell.swift
//  Pokemon Guide
//
//  Created by Ali Berkay BERBER on 21.03.2023.
//

import UIKit

class DetailScreenTableViewCell: UITableViewCell {

    @IBOutlet weak var abilitiesLabel: UILabel!
    
    @IBOutlet weak var rankLabel: UILabel!
    
    var viewModel: PokemonDetailViewModel?
    
    var pokemonMove: PokemonMove?
    
    static let identifier = "detailCell"
    
    func configure(moveUrl: String?) {
        guard let url = moveUrl else { return }
        self.viewModel = PokemonDetailViewModel(urlString: url, apiService: ApiService())
        
        self.viewModel?.bindPokemonMoveData = {
            dataMove in
            if let dataMove = dataMove {
                self.pokemonMove = dataMove
            }
            
            if let power = dataMove?.power {
                self.rankLabel.text = "\(power)"
            } else if let accuracy = dataMove?.accuracy{
                self.rankLabel.text = "\(accuracy)"
            } else if let pp = dataMove?.pp {
                self.rankLabel.text = "\(pp)"
            }else {
                self.rankLabel.text = ""
            }
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

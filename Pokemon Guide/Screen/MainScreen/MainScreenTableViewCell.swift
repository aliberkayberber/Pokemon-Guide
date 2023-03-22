//
//  MainScreenTableViewCell.swift
//  Pokemon Guide
//
//  Created by Ali Berkay BERBER on 21.03.2023.
//

import UIKit
import SDWebImage
class MainScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var view: UIView! {
        didSet {
            view.backgroundColor = .green
        }
    }
    @IBOutlet weak var pokemonImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configurePokemonCell(pokemon: Pokemon?, indexPath: IndexPath) {
    if let pokemon = pokemon {
        pokemonName.text = pokemon.name.capitalized
        pokemonImage.sd_setImage(with: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(indexPath.row + 1).png"))
        
        pokemonImage.contentMode = .scaleAspectFit
    }
        }
}

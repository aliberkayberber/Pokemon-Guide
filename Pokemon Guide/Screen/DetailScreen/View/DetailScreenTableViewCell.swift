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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

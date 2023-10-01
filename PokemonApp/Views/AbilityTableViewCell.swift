//
//  AbilityTableViewCell.swift
//  PokemonApp
//
//  Created by Carlos Obregon on 28/09/23.
//

import UIKit

class AbilityTableViewCell: UITableViewCell {
    static let cellIdentifier = "AbilityTableViewCell"
    
    @IBOutlet weak var bulletPoint: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: String) {
        abilityLabel.text = viewModel
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

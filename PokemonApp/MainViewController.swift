//
//  MainViewController.swift
//  PokemonApp
//
//  Created by Carlos Obregon on 28/09/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    @IBOutlet weak var experienceLabel: UILabel!
    
    @IBOutlet weak var amountExperienceLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//
//  MainViewController.swift
//  PokemonApp
//
//  Created by Carlos Obregon on 28/09/23.
//

import UIKit
import Alamofire

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
        
        
        
        Service.shared.execute(pokemonPath: "25", expecting: PokemonInfo.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.pokemonName.text = data.name
                print(data)
            case .failure(let error):
                // Maneja el error aquí
                print(error)
            }
        }
        
    }


}


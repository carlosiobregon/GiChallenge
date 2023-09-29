//
//  MainViewController.swift
//  PokemonApp
//
//  Created by Carlos Obregon on 28/09/23.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var amountExperienceLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var abilitiesTableView: UITableView!
    
    private var viewModel = MainViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //waiting view
        setupTableView()
        bindViewModel()
        viewModel.fetchPokemon()
    }
    
    func setupTableView() {
        abilitiesTableView.dataSource = self
        abilitiesTableView.delegate = self
    }
    
    func bindViewModel() {
        viewModel.$abilities
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.setView()
                self?.abilitiesTableView.reloadData()
            }
            .store(in: &cancellables)
        viewModel.$experience
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.setView()
            }
            .store(in: &cancellables)
    }
    
    func setView() {
        self.pokemonName.text = viewModel.name
        self.amountExperienceLabel.text = "\(viewModel.experience )"
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.pokemonImage.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
    
    @IBAction func increase(_ sender: Any) {
        viewModel.increaseExperience()
    }
    
    @IBAction func decrease(_ sender: Any) {
        viewModel.decreaseExperience()
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.abilities.count 
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AbilityTableViewCell.cellIdentifier, for: indexPath) as? AbilityTableViewCell else {
            fatalError("Unsupported cell")
        }
        
        let vm = viewModel.abilities[indexPath.row]
        cell.configure(viewModel: vm)
        cell.isUserInteractionEnabled = false
        return cell
    }

}

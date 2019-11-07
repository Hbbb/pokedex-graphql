//
//  PokemonDetailsViewController.swift
//  Pokedex
//
//  Created by Harrison Borges on 10/15/19.
//  Copyright © 2019 Harrison Borges. All rights reserved.
//

import UIKit
import Apollo
import RxSwift
import RxCocoa

class PokemonDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var classificationLabel: UILabel!

    var pokemonDetailWatcher: GraphQLQueryWatcher<PokemonDetailQuery>?
    var pokemonId: String?
    var pokemon: PokemonDetailQuery.Data.Pokemon? {
        didSet {
            self.nameLabel.text = pokemon?.fragments.detail.name
            self.numberLabel.text = pokemon?.fragments.detail.number
            self.classificationLabel.text = pokemon?.fragments.detail.classification
        }
    }

    override func viewDidLoad() {
        pokemonDetailWatcher = apollo.watch(query: PokemonDetailQuery(id: pokemonId)) { result in
            switch result {
            case .success(let graphQLResult):
                self.pokemon = graphQLResult.data?.pokemon
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Harrison Borges on 10/10/19.
//  Copyright © 2019 Harrison Borges. All rights reserved.
//

import UIKit
import Apollo

class PokemonTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!

    func configure(with pokemon: Detail) {
        nameLabel?.text = pokemon.name
        numberLabel?.text = pokemon.number
    }
}

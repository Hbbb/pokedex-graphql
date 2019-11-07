//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Harrison Borges on 10/10/19.
//  Copyright © 2019 Harrison Borges. All rights reserved.
//

import UIKit
import Apollo
import RxSwift
import RxCocoa

class PokemonListViewController: UITableViewController {
    lazy var disposeBag = DisposeBag()
    lazy var viewModel = PokemonListViewModel()
    lazy var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)

    var isLoading: Bool = false {
        didSet {
            didChangeLoadingState(isLoading)
        }
    }

    var pokemon: [PokemonListQuery.Data.Pokemon?]? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()

        tableView.rowHeight = UITableView.automaticDimension
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("PokemonListViewController -> viewWillAppear()")
        viewModel.loadData()
    }

    func setupBindings() {
        viewModel.loading.subscribe(onNext: { isLoading in
            self.isLoading = isLoading
        }).disposed(by: disposeBag)

        viewModel.error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { error in
                switch error {
                case .internetError(let message):
                    // Show not connected to the network error
                    print(message)
                case .serverError(let message):
                    // Server responded with something other than 200
                    print(message)
                }
            }).disposed(by: disposeBag)

        viewModel.pokemon.subscribe(onNext: { pokemon in
            self.pokemon = pokemon
        }).disposed(by: disposeBag)
    }

    func didChangeLoadingState(_ loading: Bool) {
        if loading {
            activityIndicator.center = self.view.center
            activityIndicator.startAnimating()

            self.view.addSubview(activityIndicator)
        } else {
            activityIndicator.stopAnimating()
        }
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemon?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PokemonTableViewCell else {
            fatalError("Could not dequeue PokemonTableViewCell")
        }

        guard let currentPokemon = pokemon?[indexPath.row] else {
            fatalError("No pokemon")
        }

        cell.configure(with: currentPokemon.fragments.detail)

        return cell
    }

    // MARK: - Segue stuff
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokemon-detail" {
            guard let selectedPokemonIndex = tableView.indexPathForSelectedRow?.row else { fatalError("Cannot find selected pokemon row") }

            let viewController = segue.destination as! PokemonDetailsViewController

            viewController.pokemonId = pokemon?[selectedPokemonIndex]?.fragments.detail.id
        }
    }
}

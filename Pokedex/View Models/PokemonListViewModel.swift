//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Harrison Borges on 10/14/19.
//  Copyright © 2019 Harrison Borges. All rights reserved.
//

import Apollo
import RxSwift
import RxCocoa

enum FetchPokemonError {
    case internetError(String)
    case serverError(String)
}

class PokemonListViewModel {
    var pokemon = PublishSubject<[PokemonListQuery.Data.Pokemon]>()
    var loading = PublishSubject<Bool>()
    var error = PublishSubject<FetchPokemonError>()
    var pokemonWatcher: GraphQLQueryWatcher<PokemonListQuery>?

    func loadData() {
        loading.onNext(true)
        
        // In a more complex example, this query might live in a Repository
        pokemonWatcher = apollo.watch(query: PokemonListQuery(first: 20)) { result in
            self.loading.onNext(false)

            switch result {
            case .success(let graphQLResult):
                guard let data = graphQLResult.data?.pokemons else { return }

                self.pokemon.onNext(data as! [PokemonListQuery.Data.Pokemon])
            case .failure(let failure):
                // Typically this would check status codes, the presence of the `error` key,
                // or general network-connectivity issues and publish accordingly

                print(failure.localizedDescription)
                self.error.onNext(.serverError("Something went wrong, please try again"))
            }
        }
    }
}

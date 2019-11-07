//
//  Apollo.swift
//  Pokedex
//
//  Created by Harrison Borges on 10/10/19.
//  Copyright © 2019 Harrison Borges. All rights reserved.
//

import Foundation
import Apollo

class Apollo {
  static let shared = Apollo()

  private(set) lazy var client = ApolloClient(url: URL(string: "https://graphql-pokemon.now.sh/graphql")!)
}

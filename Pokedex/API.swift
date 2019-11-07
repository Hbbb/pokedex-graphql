//  This file was automatically generated and should not be edited.

import Apollo

public final class PokemonDetailQuery: GraphQLQuery {
  /// query PokemonDetail($id: String) {
  ///   pokemon(id: $id) {
  ///     __typename
  ///     ...Detail
  ///   }
  /// }
  public let operationDefinition =
    "query PokemonDetail($id: String) { pokemon(id: $id) { __typename ...Detail } }"

  public let operationName = "PokemonDetail"

  public var queryDocument: String { return operationDefinition.appending(Detail.fragmentDefinition) }

  public var id: String?

  public init(id: String? = nil) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("pokemon", arguments: ["id": GraphQLVariable("id")], type: .object(Pokemon.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemon: Pokemon? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "pokemon": pokemon.flatMap { (value: Pokemon) -> ResultMap in value.resultMap }])
    }

    public var pokemon: Pokemon? {
      get {
        return (resultMap["pokemon"] as? ResultMap).flatMap { Pokemon(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "pokemon")
      }
    }

    public struct Pokemon: GraphQLSelectionSet {
      public static let possibleTypes = ["Pokemon"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(Detail.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, number: String? = nil, classification: String? = nil, weaknesses: [String?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Pokemon", "id": id, "name": name, "number": number, "classification": classification, "weaknesses": weaknesses])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var detail: Detail {
          get {
            return Detail(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class PokemonListQuery: GraphQLQuery {
  /// query PokemonList($first: Int!) {
  ///   pokemons(first: $first) {
  ///     __typename
  ///     ...Detail
  ///   }
  /// }
  public let operationDefinition =
    "query PokemonList($first: Int!) { pokemons(first: $first) { __typename ...Detail } }"

  public let operationName = "PokemonList"

  public var queryDocument: String { return operationDefinition.appending(Detail.fragmentDefinition) }

  public var first: Int

  public init(first: Int) {
    self.first = first
  }

  public var variables: GraphQLMap? {
    return ["first": first]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("pokemons", arguments: ["first": GraphQLVariable("first")], type: .list(.object(Pokemon.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemons: [Pokemon?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "pokemons": pokemons.flatMap { (value: [Pokemon?]) -> [ResultMap?] in value.map { (value: Pokemon?) -> ResultMap? in value.flatMap { (value: Pokemon) -> ResultMap in value.resultMap } } }])
    }

    public var pokemons: [Pokemon?]? {
      get {
        return (resultMap["pokemons"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Pokemon?] in value.map { (value: ResultMap?) -> Pokemon? in value.flatMap { (value: ResultMap) -> Pokemon in Pokemon(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Pokemon?]) -> [ResultMap?] in value.map { (value: Pokemon?) -> ResultMap? in value.flatMap { (value: Pokemon) -> ResultMap in value.resultMap } } }, forKey: "pokemons")
      }
    }

    public struct Pokemon: GraphQLSelectionSet {
      public static let possibleTypes = ["Pokemon"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(Detail.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, number: String? = nil, classification: String? = nil, weaknesses: [String?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Pokemon", "id": id, "name": name, "number": number, "classification": classification, "weaknesses": weaknesses])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var detail: Detail {
          get {
            return Detail(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct Detail: GraphQLFragment {
  /// fragment Detail on Pokemon {
  ///   __typename
  ///   id
  ///   name
  ///   number
  ///   classification
  ///   weaknesses
  /// }
  public static let fragmentDefinition =
    "fragment Detail on Pokemon { __typename id name number classification weaknesses }"

  public static let possibleTypes = ["Pokemon"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("number", type: .scalar(String.self)),
    GraphQLField("classification", type: .scalar(String.self)),
    GraphQLField("weaknesses", type: .list(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String? = nil, number: String? = nil, classification: String? = nil, weaknesses: [String?]? = nil) {
    self.init(unsafeResultMap: ["__typename": "Pokemon", "id": id, "name": name, "number": number, "classification": classification, "weaknesses": weaknesses])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of an object
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The name of this Pokémon
  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// The identifier of this Pokémon
  public var number: String? {
    get {
      return resultMap["number"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "number")
    }
  }

  /// The classification of this Pokémon
  public var classification: String? {
    get {
      return resultMap["classification"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "classification")
    }
  }

  /// The type(s) of Pokémons that this Pokémon weak to
  public var weaknesses: [String?]? {
    get {
      return resultMap["weaknesses"] as? [String?]
    }
    set {
      resultMap.updateValue(newValue, forKey: "weaknesses")
    }
  }
}

public struct PokemonSummary: GraphQLFragment {
  /// fragment PokemonSummary on Pokemon {
  ///   __typename
  ///   name
  ///   number
  ///   classification
  ///   weaknesses
  /// }
  public static let fragmentDefinition =
    "fragment PokemonSummary on Pokemon { __typename name number classification weaknesses }"

  public static let possibleTypes = ["Pokemon"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("number", type: .scalar(String.self)),
    GraphQLField("classification", type: .scalar(String.self)),
    GraphQLField("weaknesses", type: .list(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(name: String? = nil, number: String? = nil, classification: String? = nil, weaknesses: [String?]? = nil) {
    self.init(unsafeResultMap: ["__typename": "Pokemon", "name": name, "number": number, "classification": classification, "weaknesses": weaknesses])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The name of this Pokémon
  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// The identifier of this Pokémon
  public var number: String? {
    get {
      return resultMap["number"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "number")
    }
  }

  /// The classification of this Pokémon
  public var classification: String? {
    get {
      return resultMap["classification"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "classification")
    }
  }

  /// The type(s) of Pokémons that this Pokémon weak to
  public var weaknesses: [String?]? {
    get {
      return resultMap["weaknesses"] as? [String?]
    }
    set {
      resultMap.updateValue(newValue, forKey: "weaknesses")
    }
  }
}

//
//  Network.swift
//  SPACEX
//
//  Created by Javier Hernandez on 05/08/21.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
    
  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
}

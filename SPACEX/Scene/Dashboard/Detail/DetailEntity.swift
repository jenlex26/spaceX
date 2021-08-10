//
//  DetailEntity.swift
//  SPACEX
//
//  Created by Javier Hernandez on 06/08/21.
//  
//

import Foundation
import UIKit
// Uncomment if using Realm
//import RealmSwift

/*
 Entity: contains basic model objects used by the Interactor, it is the model representation of the data.
 
 It can holds the model types to use from the view to the database.
 
 */

struct DetailResponse: Decodable { //This can be changed to "Codable" protocol if needed
    var name    : String
    var value   : Int
    var isValid : Bool
    
    private enum CodingKeys: String, CodingKey {
        case name
        case value
        case isValid
    }
}

/*
 Uncomment if using RealmDatabase
class DetailDatabase:Object {
    var name    : String = ""
    var value   : Int    = 0
    var isValid : Bool   = false
    override static func primaryKey() -> String? {
        return "name"
    }
}
 */

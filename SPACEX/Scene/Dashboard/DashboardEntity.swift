//
//  DashboardEntity.swift
//  SPACEX
//
//  Created by Javier Hernandez on 04/08/21.
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

struct DashboardResponse: Decodable { //This can be changed to "Codable" protocol if needed
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
class DashboardDatabase:Object {
    var name    : String = ""
    var value   : Int    = 0
    var isValid : Bool   = false
    override static func primaryKey() -> String? {
        return "name"
    }
}
 */

//struct DataResponse: Decodable { //This can be changed to "Codable" protocol if needed
//    var launchesPast    : [LaunchesPastResponse]
//
//    
//    private enum CodingKeys: String, CodingKey {
//        case launchesPast
//    }
//}
//
//struct LaunchesPastResponse: Decodable { //This can be changed to "Codable" protocol if needed
//    var mission_name      : String
//    var launch_date_local : String
//    var launch_site       : LaunchSiteResonse
//    var links             : LinksResponse
//    var rocket            : RocketResponse
//    var ships             : [ShipsResponse]
//
//    
//    private enum CodingKeys: String, CodingKey {
//
//        case mission_name
//        case launch_date_local
//        case launch_site
//        case links
//        case rocket
//        case ships
//         
//    }
//}
//
//struct LaunchSiteResonse: Decodable { //This can be changed to "Codable" protocol if needed
//    var site_name_long    : String
//
//    
//    private enum CodingKeys: String, CodingKey {
//        case site_name_long
//    }
//}
//
//struct LinksResponse: Decodable { //This can be changed to "Codable" protocol if needed
//    var article_link : String?
//    var video_link   : String?
//
//    
//    private enum CodingKeys: String, CodingKey {
//        case article_link
//        case video_link
//    }
//}
//
//struct RocketResponse: Decodable { //This can be changed to "Codable" protocol if needed
//    var rocket_name  : String?
//    var first_stage  : FirstStageResponse
//    var second_stage : SecondStageResponse
//
//    
//    private enum CodingKeys: String, CodingKey {
//        case rocket_name
//        case first_stage
//        case second_stage
//    }
//}
//
//struct FirstStageResponse: Decodable { //This can be changed to "Codable" protocol if needed
//    var cores : [CoresResponse]
//
//    private enum CodingKeys: String, CodingKey {
//        case cores
//    }
//}
//
//struct CoresResponse: Decodable { //This can be changed to "Codable" protocol if needed
//    var flight : Int
//    var core   : CoreResponse
//
//    
//    private enum CodingKeys: String, CodingKey {
//        case flight
//        case core
//    }
//}
//
//struct CoreResponse: Decodable { //This can be changed to "Codable" protocol if needed
//    var reuse_count : Int?
//    var status      : String
//
//    
//    private enum CodingKeys: String, CodingKey {
//        case reuse_count
//        case status
//    }
//}
//
//
//struct SecondStageResponse: Decodable { //This can be changed to "Codable" protocol if needed
//    var payloads : [PayloadsResponse]
//
//    private enum CodingKeys: String, CodingKey {
//        case payloads
//    }
//}
//
//struct PayloadsResponse: Decodable { //This can be changed to "Codable" protocol if needed
//    var payload_type  : String?
//    var payload_mass_kg  : Int
//    var payload_mass_lbs : Double
//
//    
//    private enum CodingKeys: String, CodingKey {
//        case payload_type
//        case payload_mass_kg
//        case payload_mass_lbs
//    }
//}
//
//struct ShipsResponse: Decodable { //This can be changed to "Codable" protocol if needed
//    var name       : String?
//    var home_port  : String?
//    var image      : String?
//
//    
//    private enum CodingKeys: String, CodingKey {
//        case name
//        case home_port
//        case image
//    }
//}

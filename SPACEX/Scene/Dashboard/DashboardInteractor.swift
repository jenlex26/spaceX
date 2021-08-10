//
//  DashboardInteractor.swift
//  SPACEX
//
//  Created by Javier Hernandez on 04/08/21.
//  
//

import UIKit
import Foundation
import Apollo

/*
 Interactor: contains the business logic as specified by a use case.
 
 Bidirectionally interacts with the presenter to receive inputs, fetch data, perform complex calculations, the results of which are displayed to the user through the interactor. The Interactor can communicate with a Worker (the component responsible for fetching data from the network), based on the translated user input fed by the Interactor. In practice the Interactor can get data from a webservice.
 */

class DashboardInteractor: DashboardPresenterToInteractorProtocol {
    
    private let candidatesPath = "https://api.spacex.land/graphql/launchesPast"
    
    var launches = [LaunchPastQuery.Data.LaunchesPast]()
    
    func getData() {
        Network.shared.apollo
          .fetch(query: LaunchPastQuery()) { [weak self] result in
          
            guard let self = self else {
              return
            }

            defer {
              print("reload")
            }
                  
            switch result {
            case .success(let graphQLResult):
                if let launchConnection = graphQLResult.data?.launchesPast {
                  self.launches.append(contentsOf: launchConnection.compactMap { $0 })
                }
                        
                if let errors = graphQLResult.errors {
                  let message = errors
                        .map { $0.localizedDescription }
                        .joined(separator: "\n")
                    print(message)
                }
                self.presenter?.getLaunches(self.launches)
            case .failure(let error):
              print("ERROR \(error)")
            }
        }
    }
    
    func filterTableView(_ searchParameter: String, _ list: [LaunchPastQuery.Data.LaunchesPast]) {
        var filterData = [LaunchPastQuery.Data.LaunchesPast]()
        filterData = list.filter({
            ($0.missionName!.lowercased().contains(searchParameter))
        })
        
        presenter?.fecthFilter(list: filterData)
    }
    

    // MARK: Properties
    weak var presenter: DashboardInteractorToPresenterProtocol?
    
}


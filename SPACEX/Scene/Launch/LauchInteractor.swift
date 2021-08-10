//
//  LauchInteractor.swift
//  SPACEX
//
//  Created by Javier Hernandez on 10/08/21.
//  
//

import UIKit
import Foundation

/*
 Interactor: contains the business logic as specified by a use case.
 
 Bidirectionally interacts with the presenter to receive inputs, fetch data, perform complex calculations, the results of which are displayed to the user through the interactor. The Interactor can communicate with a Worker (the component responsible for fetching data from the network), based on the translated user input fed by the Interactor. In practice the Interactor can get data from a webservice.
 */

class LauchInteractor: LauchPresenterToInteractorProtocol {

    // MARK: Properties
    weak var presenter: LauchInteractorToPresenterProtocol?
    
    func fetchData() {
        let model = LauchResponse(name: "Text from VIPER", value: 1, isValid: true)
        presenter?.fecthData(model)
    }

}


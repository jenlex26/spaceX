//
//  DetailPresenter.swift
//  SPACEX
//
//  Created by Javier Hernandez on 06/08/21.
//  
//

import Foundation

/*
 Presenter: contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor).
 
 Interacts directly with the view and the interactor. Responsible for taking user inputs from the view, and transferring them to the interactor. Presenter changes the type of the data, if the Interactor requires the data in a specific format. In practice the modules communicate through the presenters.
 */

class DetailPresenter: DetailViewToPresenterProtocol  {
    var itemSelect: LaunchPastQuery.Data.LaunchesPast?
    
    
    // MARK: Properties
    weak var view : DetailPresenterToViewProtocol?
    var interactor: DetailPresenterToInteractorProtocol?
    var router    : DetailPresenterToRouterProtocol?
    
    func updateData(){
        interactor?.fetchData()
    }
    
    func didLoad() {
        
    }
    
}

extension DetailPresenter: DetailInteractorToPresenterProtocol {
    // TODO: implement presenter methods
    func fecthData(_ model: DetailResponse) {
        view?.showData(model)
    }
}

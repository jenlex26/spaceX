//
//  LauchPresenter.swift
//  SPACEX
//
//  Created by Javier Hernandez on 10/08/21.
//  
//

import Foundation

/*
 Presenter: contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor).
 
 Interacts directly with the view and the interactor. Responsible for taking user inputs from the view, and transferring them to the interactor. Presenter changes the type of the data, if the Interactor requires the data in a specific format. In practice the modules communicate through the presenters.
 */

class LauchPresenter: LauchViewToPresenterProtocol  {
    
    // MARK: Properties
    weak var view : LauchPresenterToViewProtocol?
    var interactor: LauchPresenterToInteractorProtocol?
    var router    : LauchPresenterToRouterProtocol?
    
    func updateData(){
        interactor?.fetchData()
    }
    
    func didLoad() {
        
    }
    
    func showDashboard() {
        router?.showDashboard()
    }
    
}

extension LauchPresenter: LauchInteractorToPresenterProtocol {
    // TODO: implement presenter methods
    func fecthData(_ model: LauchResponse) {
        view?.showData(model)
    }
}

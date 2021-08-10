//
//  DashboardPresenter.swift
//  SPACEX
//
//  Created by Javier Hernandez on 04/08/21.
//  
//

import Foundation

/*
 Presenter: contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor).
 
 Interacts directly with the view and the interactor. Responsible for taking user inputs from the view, and transferring them to the interactor. Presenter changes the type of the data, if the Interactor requires the data in a specific format. In practice the modules communicate through the presenters.
 */

class DashboardPresenter: DashboardViewToPresenterProtocol  {

    // MARK: Properties
    weak var view : DashboardPresenterToViewProtocol?
    var interactor: DashboardPresenterToInteractorProtocol?
    var router    : DashboardPresenterToRouterProtocol?
    var data: [LaunchPastQuery.Data.LaunchesPast]?

    func getData() {
        router?.presenterAlertActivity(completion: { (alert) in
            self.interactor?.getData()
        })
        
    }
    
    func showDetail(itemSelect: LaunchPastQuery.Data.LaunchesPast) {
        router?.showDetail(itemSelect: itemSelect)
    }
    
    func getFullData() {
        view?.getLaunches(data!)
    }
    
    func filterData(_ searchParameter: String) {
        interactor?.filterTableView(searchParameter, data!)
    }
}

extension DashboardPresenter: DashboardInteractorToPresenterProtocol {
    func fecthFilter(list: [LaunchPastQuery.Data.LaunchesPast]?) {
        if let filterSource = list {
            if filterSource.count == 0 {
                view?.getLaunches([LaunchPastQuery.Data.LaunchesPast]())
            }
            else {
                view?.getLaunches(filterSource)
            }
        }
    }
    
    
    func getLaunches(_ model: [LaunchPastQuery.Data.LaunchesPast]) {
        router?.stopAlertActivity(completion: {
            self.view?.getLaunches(model)
            self.data = model
        })
        
        
        // TODO: implement presenter methods
    }
}

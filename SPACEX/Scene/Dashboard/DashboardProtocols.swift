//
//  DashboardProtocols.swift
//  SPACEX
//
//  Created by Javier Hernandez on 04/08/21.
//  
//

import Foundation
import UIKit

/*
 Protocols: Defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.
 */

protocol DashboardPresenterToViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    func getLaunches (_ model: [LaunchPastQuery.Data.LaunchesPast])
}

protocol DashboardInteractorToPresenterProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func getLaunches (_ model: [LaunchPastQuery.Data.LaunchesPast])
    func fecthFilter (list: [LaunchPastQuery.Data.LaunchesPast]?)
}

protocol DashboardPresenterToInteractorProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter : DashboardInteractorToPresenterProtocol? { get set }
    func getData()
    func filterTableView(_ searchParameter: String, _ list:[LaunchPastQuery.Data.LaunchesPast])
}

protocol DashboardViewToPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view       : DashboardPresenterToViewProtocol? { get set }
    var interactor : DashboardPresenterToInteractorProtocol? { get set }
    var router     : DashboardPresenterToRouterProtocol? { get set }
    func getData()
    func showDetail(itemSelect: LaunchPastQuery.Data.LaunchesPast)
    func getFullData()
    func filterData(_ searchParameter: String)
}

protocol DashboardPresenterToRouterProtocol: AnyObject {
    // PRESENTER -> ROUTER
    
     //Uncomment if view is based on navigation controller
     var navigation: UINavigationController? { get set }
     
    func createDashboardScene() -> UIViewController
    var controller: DashboardView? { get set }
    func showNextView()
    func showDetail(itemSelect: LaunchPastQuery.Data.LaunchesPast)
    func presenterAlertActivity(completion: @escaping (UIAlertController) -> Void)
    func stopAlertActivity(completion: @escaping () -> Void)
}





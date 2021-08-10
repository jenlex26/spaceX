//
//  DetailProtocols.swift
//  SPACEX
//
//  Created by Javier Hernandez on 06/08/21.
//  
//

import Foundation
import UIKit

/*
 Protocols: Defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.
 */

protocol DetailPresenterToViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    func showData(_ model: DetailResponse)
}

protocol DetailInteractorToPresenterProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func fecthData(_ model: DetailResponse)
}

protocol DetailPresenterToInteractorProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter : DetailInteractorToPresenterProtocol? { get set }
    func fetchData()
}

protocol DetailViewToPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view       : DetailPresenterToViewProtocol? { get set }
    var interactor : DetailPresenterToInteractorProtocol? { get set }
    var router     : DetailPresenterToRouterProtocol? { get set }
    var itemSelect : LaunchPastQuery.Data.LaunchesPast? { get set }
    func didLoad()
}

protocol DetailPresenterToRouterProtocol: AnyObject {
    // PRESENTER -> ROUTER
    /*
     //Uncomment if view is based on navigation controller
     var navigation: UINavigationController? { get set }
     */
    func createDetailScene(itemSelect: LaunchPastQuery.Data.LaunchesPast) -> UIViewController
    var controller: DetailView? { get set }
    func showNextView()
}





//
//  LauchProtocols.swift
//  SPACEX
//
//  Created by Javier Hernandez on 10/08/21.
//  
//

import Foundation
import UIKit

/*
 Protocols: Defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.
 */

protocol LauchPresenterToViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    func showData(_ model: LauchResponse)
}

protocol LauchInteractorToPresenterProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func fecthData(_ model: LauchResponse)
}

protocol LauchPresenterToInteractorProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter : LauchInteractorToPresenterProtocol? { get set }
    func fetchData()
}

protocol LauchViewToPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view       : LauchPresenterToViewProtocol? { get set }
    var interactor : LauchPresenterToInteractorProtocol? { get set }
    var router     : LauchPresenterToRouterProtocol? { get set }
    func didLoad()
    func showDashboard()
}

protocol LauchPresenterToRouterProtocol: AnyObject {
    // PRESENTER -> ROUTER
    
     //Uncomment if view is based on navigation controller
     var navigation: UINavigationController? { get set }
     
    func createLauchScene() -> UIViewController
    var controller: LauchView? { get set }
    func showNextView()
    func showDashboard()
}





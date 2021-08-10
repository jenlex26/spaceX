//
//  LauchRouter.swift
//  SPACEX
//
//  Created by Javier Hernandez on 10/08/21.
//  
//

import Foundation
import UIKit

/*
 Router: contains navigation logic for describing which screens are shown in which order.
 
 Routes the App to the appropriate screen. The router has to have a direct reference to the viewcontroller, with the presenter acting as an intermediary between view and router.
 
 */

class LauchRouter: LauchPresenterToRouterProtocol {
    
    //Uncomment if view is based on navigation controller
    
    var navigation: UINavigationController?
    
    weak var controller: LauchView?
    
    func createLauchScene() -> UIViewController {
        
        /*
         Replace LauchView to match Storyboard Id
         */
        
        let view = UIStoryboard.overFullScreen(type: .launch,
                                               and: "LauchView") as? LauchView
        view?.title = ""
        
        let presenter : LauchViewToPresenterProtocol & LauchInteractorToPresenterProtocol = LauchPresenter()
        let interactor: LauchPresenterToInteractorProtocol = LauchInteractor()
        let router    : LauchPresenterToRouterProtocol = LauchRouter()
        
        
        //Uncomment if view is based on navigation controller
        
         navigation = UINavigationController(rootViewController: view!)
         router.navigation    = navigation
        navigation?.navigationBar.isTranslucent = true
        navigation?.view.backgroundColor = UIColor.clear
        router.controller    = controller
        
        view?.presenter      = presenter
        presenter.view       = view
        presenter.router     = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
//        return view!
        
        //Uncomment if view is based on navigation controller
        
         return navigation!
         
        
    }
    
    func showDashboard() {
        let module = DashboardRouter().createDashboardScene()
        navigation?.present(module, animated: true)
    }
    
    func showNextView() {
        /*
         let scene = LauchRouter().createLauchScene()
         navigation?.pushViewController(scene, animated: true)
         */
    }
    
}

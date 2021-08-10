//
//  DashboardRouter.swift
//  SPACEX
//
//  Created by Javier Hernandez on 04/08/21.
//  
//

import Foundation
import UIKit

/*
 Router: contains navigation logic for describing which screens are shown in which order.
 
 Routes the App to the appropriate screen. The router has to have a direct reference to the viewcontroller, with the presenter acting as an intermediary between view and router.
 
 */

class DashboardRouter: DashboardPresenterToRouterProtocol {
    
    //Uncomment if view is based on navigation controller
    
    var navigation: UINavigationController?
    let animation = UIAlertController.activityIndicatorLoader("Espera por favor")
    
    weak var controller: DashboardView?
    
    func createDashboardScene() -> UIViewController {
        
        /*
         Replace DashboardView to match Storyboard Id
         */
        
        let view = UIStoryboard.overFullScreen(type: .main,
                                               and: "DashboardView") as? DashboardView
        view?.title = "Lanzamientos"
        controller = view
        let presenter : DashboardViewToPresenterProtocol & DashboardInteractorToPresenterProtocol = DashboardPresenter()
        let interactor: DashboardPresenterToInteractorProtocol = DashboardInteractor()
        let router    : DashboardPresenterToRouterProtocol = DashboardRouter()
        
        
        //Uncomment if view is based on navigation controller
        
         navigation = UINavigationController(rootViewController: view!)
         router.navigation    = navigation
         
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
    
    func presenterAlertActivity(completion: @escaping (UIAlertController) -> Void){
        controller?.present(animation, animated: true, completion: {
            completion(self.animation)
        })
    }
    
    func stopAlertActivity(completion: @escaping () -> Void){
        animation.dismiss(animated: true) {
            completion()
        }
    }
    
    func showDetail(itemSelect: LaunchPastQuery.Data.LaunchesPast) {
        let view = DetailRouter().createDetailScene(itemSelect: itemSelect)
        navigation?.pushViewController(view, animated: true)
    }
    
    func showNextView() {
        /*
         let scene = DashboardRouter().createDashboardScene()
         navigation?.pushViewController(scene, animated: true)
         */
    }
    
}

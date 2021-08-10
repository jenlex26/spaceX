//
//  DetailRouter.swift
//  SPACEX
//
//  Created by Javier Hernandez on 06/08/21.
//  
//

import Foundation
import UIKit

/*
 Router: contains navigation logic for describing which screens are shown in which order.
 
 Routes the App to the appropriate screen. The router has to have a direct reference to the viewcontroller, with the presenter acting as an intermediary between view and router.
 
 */

class DetailRouter: DetailPresenterToRouterProtocol {
    
    //Uncomment if view is based on navigation controller
    /*
    var navigation: UINavigationController?
    */
    weak var controller: DetailView?
    
    func createDetailScene(itemSelect: LaunchPastQuery.Data.LaunchesPast) -> UIViewController {
        
        /*
         Replace DetailView to match Storyboard Id
         */
        
        let view = UIStoryboard.overFullScreen(type: .detail,
                                               and: "DetailView") as? DetailView
        view?.title = itemSelect.missionName
        
        let presenter : DetailViewToPresenterProtocol & DetailInteractorToPresenterProtocol = DetailPresenter()
        let interactor: DetailPresenterToInteractorProtocol = DetailInteractor()
        let router    : DetailPresenterToRouterProtocol = DetailRouter()
        
        
        //Uncomment if view is based on navigation controller
        /*
         navigation = UINavigationController(rootViewController: view!)
         router.navigation    = navigation
         */
        router.controller    = controller
        
        presenter.itemSelect = itemSelect
        view?.presenter      = presenter
        presenter.view       = view
        presenter.router     = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view!
        
        //Uncomment if view is based on navigation controller
        /*
         return navigation!
         */
        
    }
    
    func showNextView() {
        /*
         let scene = DetailRouter().createDetailScene()
         navigation?.pushViewController(scene, animated: true)
         */
    }
    
}

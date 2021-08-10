//
//  lauchRouter.swift
//  SPACEX
//
//  Created by Javier Hernandez on 10/08/21.
//

import Foundation
import UIKit

/*
 Router: contains navigation logic for describing which screens are shown in which order.
 Routes the App to the appropriate screen. The router has to have a direct reference to the viewcontroller, with the presenter acting as an intermediary between view and router.
 
 */

//class lauchRouter {
//
//    func createLauchRouterScene()-> UIViewController {
//
//        /*
//         Replace DashboardView to match Storyboard Id
//         */
//
//        let view = UIStoryboard.overFullScreen(type: .main,
//                                               and: "DashboardView") as? DashboardView
//
//
//        //Uncomment if view is based on navigation controller
//
//         navigation = UINavigationController(rootViewController: view!)
//         router.navigation    = navigation
//
//        router.controller    = controller
//
//        view?.presenter      = presenter
//        presenter.view       = view
//        presenter.router     = router
//        presenter.interactor = interactor
//        interactor.presenter = presenter
//
////        return view!
//
//        //Uncomment if view is based on navigation controller
//
//         return navigation!
//    }
//}

//
//  LauchView.swift
//  SPACEX
//
//  Created by Javier Hernandez on 10/08/21.
//  
//

import Foundation
import UIKit
import Lottie

/*
 View: displays what it is told to by the Presenter and relays user input back to the Presenter, the View is passive. It waits for the Presenter to give it content to display.
 
 Use the data sent by the presenter, and display it. Can also pass touch events, but will simply notify the presenter of this, where the work to process the touch takes place. In practice the view sets up the presenter (owns it), and sends messages to the same.
 */

class LauchView: UIViewController {
    /*
     Replace UIViewController to UITableViewController or UICollectionViewController if needed
     */

    @IBOutlet weak var viewAnimation: AnimationView!
    
    // MARK: Properties
    var presenter: LauchViewToPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.didLoad()
        
        viewAnimation.animation = Animation.named("nasa")
        viewAnimation.play { (true) in
            self.presenter?.showDashboard()
        }
    }
    
    func setup() {
        // Do any aditional setup after loading the view ex: View properties, navigation properties, etc.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension LauchView: LauchPresenterToViewProtocol {

    func showData(_ model: LauchResponse) {

//         Example:
//         UILabel.text = model.name

    }
}

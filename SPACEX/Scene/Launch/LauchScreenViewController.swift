//
//  LauchScreenViewController.swift
//  SPACEX
//
//  Created by Javier Hernandez on 10/08/21.
//

import UIKit
import Lottie

class LauchScreenViewController: UIViewController {
    @IBOutlet weak var viewAnimation: AnimationView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        viewAnimation.animation = Animation.named("nasa")
            viewAnimation.play { (true) in
                print("aaaa")
            }
        
    }
}

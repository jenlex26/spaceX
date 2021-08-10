//
//  UIAlertController+Addons.swift
//  SPACEX
//
//  Created by Javier Hernandez on 10/08/21.
//

import Foundation
import UIKit

extension UIAlertController {
    static func activityIndicatorLoader(_ message:String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x:alert.view.frame.origin.x + 8, y: 15 , width: 30, height: 30)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .whiteLarge
        loadingIndicator.startAnimating();
        loadingIndicator.color = UIColor.gray
        alert.view.addSubview(loadingIndicator)
        return alert
    }
}

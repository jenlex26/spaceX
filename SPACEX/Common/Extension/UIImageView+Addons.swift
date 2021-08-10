//
//  UIImageView+Addons.swift
//  SPACEX
//
//  Created by Javier Hernandez on 09/08/21.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func imageFromServerURL(urlString:String){
        let url = URL(string: urlString)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "notPhoto"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.5)),
                .cacheOriginalImage
            ])
    }
}

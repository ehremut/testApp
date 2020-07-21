//
//  TablaViewController.swift
//  tApp
//
//  Created by macOS developer on 18.07.2020.
//  Copyright © 2020 macOS developer. All rights reserved.
//

import UIKit

protocol AlertControllerProtocol: class {
    func addImage(imageView: UIImageView)
}

extension UIAlertController: AlertControllerProtocol{
    
    func addImage(imageView: UIImageView){
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY , relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120.0))
        self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120.0))
        
    }
    
}

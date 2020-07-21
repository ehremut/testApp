//
//  ModuleBuilder.swift
//  tApp
//
//  Created by macOS developer on 16.07.2020.
//  Copyright © 2020 macOS developer. All rights reserved.
//

import UIKit

// MARK: - Protocol

protocol BuilderProtocol {
    static func createMainModule() -> UIViewController
}


// MARK: - Class

class ModelBuilder: BuilderProtocol{
    static func createMainModule() -> UIViewController {
       // let model = JsonData()
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        
        return view
    }
    
    
    
}

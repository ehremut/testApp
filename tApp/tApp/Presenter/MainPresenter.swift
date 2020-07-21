//
//  MainPresenter.swift
//  tApp
//
//  Created by macOS developer on 16.07.2020.
//  Copyright © 2020 macOS developer. All rights reserved.
//

import Foundation


// MARK: - Protocol

protocol MainViewProtocol: class {
    func success()
    func failure(error: Error)
}


protocol MainPresenterProtocol: class {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getJsonData()
    var jsonData: JsonData? {get set}
    var picture: Data? {get set}
    func getPicture(url: URL)
    var variants: Selectors? {get set}
}


// MARK: - Class
class MainPresenter: MainPresenterProtocol{
    
    
    var variants: Selectors?
    var picture: Data?
    
    var jsonData: JsonData?
    
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol){
        self.view = view
        self.networkService = networkService
        getJsonData()
        //variants = nil
    }
    
    func getPicture(url: URL)   {
            if let data = try? Data(contentsOf: url){
                    self.picture = data
        }
    }
    
    func getJsonData() {
        networkService.getJsonData { [weak self] result  in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.jsonData = data
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
}


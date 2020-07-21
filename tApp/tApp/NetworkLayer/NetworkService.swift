//
//  NetworkService.swift
//  tApp
//
//  Created by macOS developer on 16.07.2020.
//  Copyright © 2020 macOS developer. All rights reserved.
//

import Foundation

// MARK: - Protocol



protocol NetworkServiceProtocol {
    func getJsonData(completion: @escaping (Result<JsonData?, Error>) -> Void)
}



// MARK: - Class
class NetworkService: NetworkServiceProtocol{

    func getJsonData(completion: @escaping (Result<JsonData?, Error>) -> Void) {
        let urlStr = "https://pryaniky.com/static/json/sample.json"
        guard let url = URL(string: urlStr) else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(JsonData.self, from: data!)
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
        
    }
}

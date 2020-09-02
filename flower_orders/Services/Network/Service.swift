//
//  Service.swift
//  flower_orders
//
//  Created by Calin Ciubotariu on 28/08/2020.
//  Copyright © 2020 Calin Ciubotariu. All rights reserved.
//

import Foundation

class ServiceLayer {
    
    class func request<T: Codable>(router: API, completion: @escaping (Result<[T], Error>) -> ()) {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
                return
            }
            
            
            guard response != nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            let responseObject = try! JSONDecoder().decode([T].self, from: data)
            DispatchQueue.main.async {
                completion(.success(responseObject))
            }
        }
        dataTask.resume()
    }
}

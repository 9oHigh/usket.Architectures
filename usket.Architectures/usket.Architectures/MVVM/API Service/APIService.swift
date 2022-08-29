//
//  APIService.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/13.
//

import Foundation

final class APIService {
    
    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    
    func requestEmployees(onCompletion: @escaping (Source) -> Void) {
        
        URLSession.shared.dataTask(with: sourcesURL) {
            data, response, error in
            
            guard let data = data else { return }
            guard let datum = try? JSONDecoder().decode(Source.self, from: data) else { return }
            onCompletion(datum)
        }.resume()
    }
}

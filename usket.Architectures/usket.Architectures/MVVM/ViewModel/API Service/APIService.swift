//
//  APIService.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/13.
//

import Foundation
import RxSwift

final class APIService {
    
    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    
    
    func requestEmployees() -> [Datum] {
        
        URLSession.shared.dataTask(with: sourcesURL) {
            data, response, error in

           
        }.resume()
        return [Datum(id: 0, employeeName: "", employeeSalary: 0, employeeAge: 0, profileImage: "")]
    }
}
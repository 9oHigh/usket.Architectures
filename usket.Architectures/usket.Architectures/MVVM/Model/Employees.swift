//
//  EmployeesModel.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/13.
//

import Foundation

// MARK: - Source
struct Source: Codable {
    let status: String
    let data: [Datum]
    let message: String
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}


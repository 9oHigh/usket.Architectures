//
//  EmployeesButton.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/16.
//

import UIKit

final class EmployeesButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfig() {
        backgroundColor = .black
        
        setTitle("Fetch Employees", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 14)

        layer.cornerRadius = 5
    }
}

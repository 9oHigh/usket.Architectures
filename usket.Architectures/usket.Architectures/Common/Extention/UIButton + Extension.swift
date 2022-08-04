//
//  UIButton + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/03.
//

import UIKit

extension UIButton {
    
    func setArchitectureButton(title: String) {
        backgroundColor = .black
        layer.cornerRadius = 10
        
        titleLabel?.textColor = .white
        titleLabel?.font = .boldSystemFont(ofSize: 18)
        setTitle(title, for: .normal)
    }
}

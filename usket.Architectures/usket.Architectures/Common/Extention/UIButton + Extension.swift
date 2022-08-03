//
//  UIButton + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/03.
//

import UIKit

extension UIButton {
    
    func setStartButton() {
        backgroundColor = .black
        layer.cornerRadius = 10
        
        titleLabel?.textColor = .white
        titleLabel?.font = .boldSystemFont(ofSize: 20)
        setTitle("시작하기", for: .normal)
    }
    
    func setArchitectureButton(title: String) {
        backgroundColor = .black
        layer.cornerRadius = 10
        
        titleLabel?.textColor = .white
        titleLabel?.font = .boldSystemFont(ofSize: 20)
        setTitle(title, for: .normal)
    }
}

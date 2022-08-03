//
//  UIStackView + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/03.
//

import UIKit

extension UIStackView {
    
    func setArchitectureStackView(names: [String]) {
        alignment = .center
        axis = .vertical
        spacing = 10
        backgroundColor = .white
        distribution = .fillEqually
        
        let buttonArray: [UIButton] = [UIButton](repeating: UIButton(), count: names.count)
        
        for (button, name) in zip(buttonArray, names) {
            button.setArchitectureButton(title: name)
            addArrangedSubview(button)
        }
    }
}

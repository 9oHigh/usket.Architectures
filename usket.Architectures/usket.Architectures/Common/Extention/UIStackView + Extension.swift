//
//  UIStackView + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/03.
//

import UIKit

extension UIStackView {
    
    // 만약 버튼들의 너비를 일괄로 주고 싶다면
    // alignment를 fill로 해주면 해결가능하다.
    func setArchitectureStackView(names: [String], verticalSpacing: CGFloat) {
        alignment = .fill
        backgroundColor = .white
        axis = .vertical
        spacing = verticalSpacing
        distribution = .fillEqually
        
        names.forEach { title in
            let architectureButton = UIButton()
            architectureButton.setArchitectureButton(title: title)
            addArrangedSubview(architectureButton)
        }
    }
    
    func returnButtonAtIndex(index: Int) -> UIButton? {
        
        guard let architectureButton = arrangedSubviews[index] as? UIButton else {
            return nil
        }

        return architectureButton
    }
}

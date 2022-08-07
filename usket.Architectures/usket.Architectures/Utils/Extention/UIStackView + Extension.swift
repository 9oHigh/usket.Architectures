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
    func setArchitectureStackView(names: [String], nextPages: [NextPage], verticalSpacing: CGFloat) {
        alignment = .fill
        backgroundColor = .white
        axis = .vertical
        spacing = verticalSpacing
        distribution = .fillEqually
    
        for (name, nextPage) in zip(names, nextPages) {
            let architectureButton = ArchitectureButton()
            architectureButton.initializeNextPage(title: name, nextPage: nextPage)
            addArrangedSubview(architectureButton)
        }
    }
    
    func returnButtonAtIndex(index: Int) -> UIButton? {
        guard let architectureButton = arrangedSubviews[index] as? ArchitectureButton else {
            return nil
        }
        return architectureButton
    }
}

//
//  UIStackView + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/03.
//

import UIKit

extension UIStackView {
    
    func setArchitectureStackView() {
        backgroundColor = .white
        // 만약 버튼들의 너비를 일괄로 주고 싶다면
        // alignment를 fill로 해주면 해결가능하다.
        alignment = .fill
        axis = .vertical
        spacing = 20
        distribution = .fillEqually
    }
}

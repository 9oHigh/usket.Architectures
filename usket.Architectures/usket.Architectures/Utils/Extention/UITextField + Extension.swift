//
//  UITextField + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/08.
//

import UIKit

extension UITextField {
    
    func setUserInfoTextField() {
        backgroundColor = .white
        
        textColor = .black
        textAlignment = .left
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.height))
        
        leftView = paddingView
        leftViewMode = ViewMode.always
        
        rightView = paddingView
        rightViewMode = ViewMode.always
    }
}

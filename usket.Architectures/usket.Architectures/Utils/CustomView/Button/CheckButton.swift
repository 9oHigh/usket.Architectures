//
//  CheckButton.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/09.
//

import UIKit

final class CheckButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeTitle(title: String) {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.cornerRadius = 5
        setTitleColor(.black, for: .normal)
        setTitle(title, for: .normal)
    }
}

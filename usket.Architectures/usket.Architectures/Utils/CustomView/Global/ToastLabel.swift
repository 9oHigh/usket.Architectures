//
//  ToastLabel.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/08.
//

import UIKit

final class ToastLabel: UILabel {
    
    private var padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setToastLabel()
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setToastLabel() {
        // Text
        numberOfLines = 0
        textColor = .white
        textAlignment = .center
        // View
        backgroundColor = .black
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}

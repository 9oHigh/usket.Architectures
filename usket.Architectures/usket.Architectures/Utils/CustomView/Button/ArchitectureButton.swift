//
//  ArchitectureButton.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/06.
//

import UIKit

class ArchitectureButton: UIButton {
    
    var nextPage: NextPage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeNextPage(title: String, nextPage: NextPage) {
        self.nextPage = nextPage
        backgroundColor = .black
        layer.cornerRadius = 10
        
        titleLabel?.textColor = .white
        titleLabel?.font = .boldSystemFont(ofSize: 18)
        setTitle(title, for: .normal)
    }
}

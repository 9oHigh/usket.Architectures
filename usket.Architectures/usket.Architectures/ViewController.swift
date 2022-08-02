//
//  ViewController.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/02.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        button.backgroundColor = .red
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }

    }
}


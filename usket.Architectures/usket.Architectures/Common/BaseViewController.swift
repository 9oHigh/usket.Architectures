//
//  BaseViewController.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/03.
//

import UIKit

protocol BaseInitializing {
    func setConfig()
    func setUI()
    func setConstraints()
    func setBinding()
}

class BaseViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

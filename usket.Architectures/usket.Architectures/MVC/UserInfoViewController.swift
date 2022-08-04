//
//  UserInfoViewController.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/03.
//

import UIKit

final class UserInfoViewController: BaseViewController, BaseInitializing {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "안녕하시게~"
        setConfig()
    }
    
    func setConfig() {
        setNavigationBackButton(barTintColor: .black)
        
    }
    
    func setUI() {
        
    }
    
    func setConstraints() {
        
    }
    
    func setBinding() {
        
    }
}

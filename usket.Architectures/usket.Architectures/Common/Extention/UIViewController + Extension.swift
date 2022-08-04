//
//  UIViewController + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/04.
//

import UIKit

extension UIViewController {

    func pushNextViewController(_ viewController: UIViewController, animated: Bool) {
        
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func setNavigationBackButton(barTintColor: UIColor) {
        
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.topItem?.title = "뒤로"
    }
}

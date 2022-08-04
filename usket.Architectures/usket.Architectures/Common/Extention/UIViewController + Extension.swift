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
    
    func setDefaultNavigationBar() {
        guard let navigationController = navigationController else { return }
        
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navigationController.navigationBar.tintColor = .black
    }
}

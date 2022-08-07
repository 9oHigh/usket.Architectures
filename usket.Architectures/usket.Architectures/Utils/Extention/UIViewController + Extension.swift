//
//  UIViewController + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/04.
//

import UIKit

extension UIViewController {

    func pushToNextViewController(title: String?, _ viewController: UIViewController, animated: Bool = true) {
        
        guard let navigationController = navigationController else { return }
        viewController.title = title
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func dismissToPrevViewController(animated: Bool = true) {
        dismiss(animated: animated)
    }
    
    func setDefaultNavigationBar() {
        guard let navigationController = navigationController else { return }
        
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navigationController.navigationBar.tintColor = .black
    }
}

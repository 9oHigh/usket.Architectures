//
//  UIViewController + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/04.
//

import UIKit

extension UIViewController {

    // MARK: - Global
    
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
    
    func showToast(message: String) {
        let toastMessage = ToastLabel()
        toastMessage.text = message
        
        view.addSubview(toastMessage)
        toastMessage.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(UIScreen.main.bounds.width * 0.75)
            make.center.equalToSuperview()
        }
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut) {
            toastMessage.alpha = 0
        } completion: { _ in
            toastMessage.removeFromSuperview()
        }
    }
}

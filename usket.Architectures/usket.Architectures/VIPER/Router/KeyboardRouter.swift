//
//  KeyboardRouter.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/23.
//

import UIKit

final class KeyboardRouter: KeyboardListRouterProtocol {
    
    func pushToKeyboardDetail(with keyboard: Keyboard, from view: UIViewController) {
    
    }
    
    static func createKeyboardListModule(view: UIViewController) -> UIViewController {
        
        return KeyboardViewController()
    }
}

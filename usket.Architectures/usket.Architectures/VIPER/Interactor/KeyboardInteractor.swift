//
//  KeyboardInteractor.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/23.
//

import Foundation

final class KeyboardInteractor: KeyboardListInputInteractorProtocol, KeyboardListoutputInteractorProtocol {
    
    var presenter: KeyboardListoutputInteractorProtocol?
    
    func getKeyboardList() {
        
    }
    
    func keyboardListDidFetch(keyboardList: [Keyboard]) {
        
    }
}

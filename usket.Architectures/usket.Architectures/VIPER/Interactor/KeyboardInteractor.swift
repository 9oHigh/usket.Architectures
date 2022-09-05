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
        // 서버 혹은 로컬의 데이터를 가지고 오는 로직이 있겠으나
        // 현재 배열 형태의 프로퍼티에 저장된 상태입니다.
        // fetchedKeyboardList
        presenter?.keyboardListDidFetch(keyboardList: fetchedKeyboardList)
    }
    
    func keyboardListDidFetch(keyboardList: [Keyboard]) {
        
    }
}

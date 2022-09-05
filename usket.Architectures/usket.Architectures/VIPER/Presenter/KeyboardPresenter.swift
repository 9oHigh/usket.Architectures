//
//  KeyboardPresenter.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/23.
//

import UIKit

final class KeyboardPresenter: KeyboardListPresenterProtocol, KeyboardListViewProtocol {
    
    var interactor: KeyboardListInputInteractorProtocol?
    var view: KeyboardListViewProtocol?
    var router: KeyboardListRouterProtocol?
    
    func viewDidLoad() {
        interactor?.getKeyboardList()
        view?.showKeyboards(with: <#T##[Keyboard]#>)
    }
    
    func showKeyboardInformation(with keyboard: Keyboard, from view: UIViewController) {
        
    }
    
    func showKeyboards(with keyboards: [Keyboard]) {
    
    }
}

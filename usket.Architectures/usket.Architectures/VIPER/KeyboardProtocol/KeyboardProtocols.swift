//
//  KeyboardProtocols.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/29.
//

import UIKit

// Presenter -> View
protocol KeyboardListViewProtocol {
    func showKeyboards(with keyboards: [Keyboard])
}
// View -> Presenter
protocol KeyboardListPresenterProtocol {
    var interactor: KeyboardListInputInteractorProtocol? { get set }
    var view: KeyboardListViewProtocol? { get set }
    var router: KeyboardListRouterProtocol? { get set }
    
    func viewDidLoad()
    func showKeyboardInformation(with keyboard: Keyboard, from view: UIViewController)
}
// Presenter -> Interactor
protocol KeyboardListInputInteractorProtocol {
    var presenter: KeyboardListoutputInteractorProtocol? { get set }
    
    func getKeyboardList()
}
// Interactor -> Presenter
protocol KeyboardListoutputInteractorProtocol {
    func keyboardListDidFetch(keyboardList: [Keyboard])
}
// Presenter -> Router
protocol KeyboardListRouterProtocol {
    func pushToKeyboardDetail(with keyboard: Keyboard, from view: UIViewController)
    static func createKeyboardListModule(viewController: UIViewController)
}

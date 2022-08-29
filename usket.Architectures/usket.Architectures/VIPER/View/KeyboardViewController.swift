//
//  KeyboardViewController.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/23.
//

import UIKit
import RxSwift

final class KeyboardViewController: BaseViewController, BaseInitializing {
    
    private let keyboardTableView: UITableView = UITableView()
    private let keyboardFetchButton: UIButton = UIButton()
    private let presenter: KeyboardPresenter = KeyboardPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
        setUI()
        setConstraints()
        presenter.viewDidLoad()
    }
    
    func setConfig() {
        // Keyboard
        keyboardFetchButton.setKeyboadButton(name: "키보드 가져오기")
        
        // TableView
        keyboardTableView.backgroundColor = .white
        keyboardTableView.separatorStyle = .none
        keyboardTableView.rowHeight = 100
        keyboardTableView.register(KeyboardTableViewCell.self, forCellReuseIdentifier: KeyboardTableViewCell.identifier)
    }
    
    func setUI() {
        view.addSubview(keyboardFetchButton)
        view.addSubview(keyboardTableView)
    }
    
    func setConstraints() {
        
        keyboardFetchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(62)
        }
        
        keyboardTableView.snp.makeConstraints { make in
            make.top.equalTo(keyboardFetchButton.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.bottom.equalToSuperview()
        }
    }
}

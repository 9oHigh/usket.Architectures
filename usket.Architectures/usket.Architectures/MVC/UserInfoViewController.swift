//
//  UserInfoViewController.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/03.
//

import UIKit

final class UserInfoViewController: BaseViewController, BaseInitializing {

    private let titleLabel = UILabel()
    private let userNameTextField = UserInfoInputView(title: "Name")
    private let userAgeTextField = UserInfoInputView(title: "Age")
    private let userInfoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
        setUI()
        setConstraints()
    }
   
    func setConfig() {
        titleLabel.setTitleLabel(title: "Input Your Information")
        userInfoLabel.setUserInfoLabel()
    }
    
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(userNameTextField)
        view.addSubview(userAgeTextField)
        view.addSubview(userInfoLabel)
    }
    
    func setConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(userNameTextField.snp.top).offset(-30)
        }
        
        userNameTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
        }
        
        userAgeTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(userNameTextField.snp.bottom).offset(30)
        }
        
        userInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(userAgeTextField.snp.bottom).offset(40)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.centerX.equalToSuperview()
        }
    }
}

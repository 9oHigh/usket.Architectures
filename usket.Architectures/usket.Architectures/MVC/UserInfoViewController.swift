//
//  UserInfoViewController.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/03.
//

import UIKit

final class UserInfoViewController: BaseViewController, BaseInitializing {

    private let titleLabel = UILabel()
    private let userNameInputView = UserInfoInputView(title: "Name")
    private let userAgeInputView = UserInfoInputView(title: "Age")
    private let userInfoLabel = UILabel()
    private let checkButton = CheckButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
        setUI()
        setConstraints()
    }
   
    func setConfig() {
        titleLabel.setTitleLabel(title: "Input Your Information")
        userInfoLabel.setUserInfoLabel()
        checkButton.initializeTitle(title: "확인")
        checkButton.addTarget(self, action: #selector(showUserInfo), for: .touchUpInside)
    }
    
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(userNameInputView)
        view.addSubview(userAgeInputView)
        view.addSubview(userInfoLabel)
        view.addSubview(checkButton)
    }
    
    func setConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(userNameInputView.snp.top).offset(-30)
        }
        
        userNameInputView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
        }
        
        userAgeInputView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(userNameInputView.snp.bottom).offset(30)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(userAgeInputView.snp.bottom).offset(40)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.centerX.equalToSuperview()
        }
        
        userInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(checkButton.snp.bottom).offset(40)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc
    private func showUserInfo() {
        guard let userName = userNameInputView.getUserInfo(), userName != ""  else {
            showToast(message: "이름을 입력하지 않았어요.")
            return
        }
        guard let userAge = userAgeInputView.getUserInfo(), userAge != "" else {
            showToast(message: "나이를 입력하지 않았어요.")
            return
        }
        let userInfo = UserInfo(name: userName, age: userAge)
        userInfoLabel.setCheckUserInformation(userInfo: userInfo)
    }
}

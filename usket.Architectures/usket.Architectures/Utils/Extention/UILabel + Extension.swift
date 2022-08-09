//
//  UIView + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/08.
//

import UIKit

extension UILabel {

    // MARK: - UserInfoViewController
    
    func setUserInfoLabel() {
        textColor = .black
        textAlignment = .left
        numberOfLines = 0
        font = .boldSystemFont(ofSize: 18)
    }
    
    func setTitleLabel(title: String) {
        text = title
        textColor = .black
        textAlignment = .center
        font = .boldSystemFont(ofSize: 25)
    }
    
    func setCheckUserInformation(userInfo: UserInfo) {
        let checkMessage = "Check your information.\n\n"
        text = checkMessage + "Name: " + userInfo.name + "\n\n" + "Age: " + userInfo.age
    }
    
    // MARK: - UserInfoInputView
    
    func setUserInfoInputLabel() {
        textColor = .black
        textAlignment = .left
        font = .boldSystemFont(ofSize: 18)
    }
}

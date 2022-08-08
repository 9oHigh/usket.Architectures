//
//  UserInfoInputView.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/08.
//

import UIKit

final class UserInfoInputView: UIView, BaseInitializing {
    
    private let titleLabel = UILabel()
    private let contentTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfig()
        setUI()
        setConstraints()
    }
    
    convenience init(title: String) {
        self.init()
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfig() {
        // TitleLabel
        titleLabel.setUserInfoInputLabel()
        // ContentTextField
        contentTextField.setUserInfoTextField()
    }
    
    func setUI() {
        addSubview(titleLabel)
        addSubview(contentTextField)
    }
    
    func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
        }
        
        contentTextField.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview()
        }
    }
}

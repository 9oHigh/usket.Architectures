//
//  KeyboardTableViewCell.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/29.
//

import UIKit

final class KeyboardTableViewCell: UITableViewCell, BaseInitializing {
    
    static let identifier: String = "KeyboardTableViewCell"
    private let brandLabel = UILabel()
    private let typeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConfig()
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfig() {
        brandLabel.setKeyboardBrandLabel()
        typeLabel.setKeyboardTypeLabel()
    }
    
    func setUI() {
        contentView.addSubview(brandLabel)
        contentView.addSubview(typeLabel)
        contentView.isUserInteractionEnabled = true
    }
    
    func setConstraints() {
        
        brandLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalTo(typeLabel.snp.trailing).offset(10)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
        }
    }
    
    func setKeyboard(with keyboard: Keyboard) {
        brandLabel.text = keyboard.brand
        typeLabel.text = keyboard.type
    }
}

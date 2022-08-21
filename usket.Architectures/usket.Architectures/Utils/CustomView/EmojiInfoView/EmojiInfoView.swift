//
//  EmojiInfoView.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/21.
//

import UIKit

final class emojiInfoView: UIView, BaseInitializing {
    
    private let faceLabel = UILabel()
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfig()
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfig() {
        faceLabel.setEmojiInfoFaceLabel()
        nameLabel.setEmojiInfoNameLabel()
    }
    
    func setUI() {
        addSubview(faceLabel)
        addSubview(nameLabel)
    }
    
    func setConstraints() {
        faceLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(faceLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func setEmojiView(emoji: Emoji) {
        faceLabel.text = emoji.emoji
        nameLabel.text = emoji.name
    }
}

//
//  UIButton + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/09.
//

import UIKit

extension UIButton {
   
    // MARK: - EmojiViewController
    
    func setEmojiButton(name: String) {
        
        setTitle(name, for: .normal)
        setTitleColor(.white, for: .normal)
        
        backgroundColor = .black
        layer.cornerRadius = 5
    }
    
    //MARK: - KeyboadViewController
    
    func setKeyboadButton(name: String) {
        
        setTitle(name, for: .normal)
        setTitleColor(.white, for: .normal)
        
        backgroundColor = .black
        layer.cornerRadius = 5
    }
}

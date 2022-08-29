//
//  Keyboard.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/23.
//

import Foundation

struct Keyboard {
    
    let brand: String
    let type: String
    
    init(brand: String, type: String) {
        self.brand = brand
        self.type = type
    }
}

let keyboardList: [Keyboard] = [
    Keyboard(brand: "KeyChron", type: "Red"),
    Keyboard(brand: "Hansung", type: "Capacitive"),
    Keyboard(brand: "KeyChron", type: "Brown"),
    Keyboard(brand: "Realforce", type: "Red"),
    Keyboard(brand: "KeyChron", type: "Blue")
]

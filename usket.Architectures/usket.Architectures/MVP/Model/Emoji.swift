//
//  Emoji.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/21.
//

import UIKit

struct Emoji {
    let emoji: String
    let name: String
    
    init(emoji: String, name: String) {
        self.emoji = emoji
        self.name = name
    }
}

let emojiList: [Emoji] = [
    Emoji(emoji: "😊", name: "Happy"),
    Emoji(emoji: "😡", name: "Angry"),
    Emoji(emoji: "😞", name: "Sad"),
    Emoji(emoji: "😲", name: "Surprised"),
    Emoji(emoji: "🥳", name: "Celebrate")
]

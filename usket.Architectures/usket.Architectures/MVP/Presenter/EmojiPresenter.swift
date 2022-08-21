//
//  EmojiPresenter.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/21.
//

import Foundation

protocol EmojiProtocol {
    var emoji: Emoji? { get set }
    func nextEmoji()
    func prevEmoji()
}

final class EmojiPresenter: EmojiProtocol {
    
    var emoji: Emoji?
    var index: Int = 0
    
    func nextEmoji() {
        index = index < emojiList.count - 1 ? index + 1: index
        emoji = emojiList[index]
    }
    
    func prevEmoji() {
        index = index > 0 ? index - 1 : index
        emoji = emojiList[index]
    }
}

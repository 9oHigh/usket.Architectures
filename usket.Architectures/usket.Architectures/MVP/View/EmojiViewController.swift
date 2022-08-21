//
//  TrafficButtonViewController.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/20.
//

import UIKit
import RxCocoa
import RxSwift

final class EmojiViewController: BaseViewController, BaseInitializing {
    
    private let disposeBag = DisposeBag()
    private let emojiView = emojiInfoView()
    private let nextButton = UIButton()
    private let prevButton = UIButton()
    private let presenter = EmojiPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
        setUI()
        setConstraints()
        bind()
        
        presenter.emoji = Emoji(emoji: "🧑🏻‍💻", name: "Hello, word!")
        emojiView.setEmojiView(emoji: presenter.emoji!)
    }
    
    func setConfig() {
        nextButton.setEmojiButton(name: "NEXT")
        prevButton.setEmojiButton(name: "PREV")
    }
    
    func setUI() {
        view.addSubview(emojiView)
        view.addSubview(nextButton)
        view.addSubview(prevButton)
    }
    
    func setConstraints() {
        
        emojiView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        prevButton.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(50)
        }
        
        nextButton.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(50)
        }
    }
    
    func bind() {
        
        nextButton.rx.tap
            .subscribe({ [weak self] _ in
                self?.presenter.nextEmoji()
                self?.emojiView.setEmojiView(emoji: self!.presenter.emoji!)
            })
            .disposed(by: disposeBag)
        
        prevButton.rx.tap
            .subscribe({ [weak self] _ in
                self?.presenter.prevEmoji()
                self?.emojiView.setEmojiView(emoji: self!.presenter.emoji!)
            })
            .disposed(by: disposeBag)
    }
}

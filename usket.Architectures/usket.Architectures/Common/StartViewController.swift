//
//  ViewController.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/02.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class StartViewController: BaseViewController, BaseInitializing {
    
    private let startButton = UIButton()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
        setUI()
        setConstraints()
        setBinding()
    }
    
    func setConfig() {
        startButton.setStartButton()
    }
    
    func setUI() {
        view.addSubview(startButton)
    }
    
    func setConstraints() {
        
        startButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
    }
    
    func setBinding() {
        startButton.rx.tap
            .bind{
                let chooseViewController = ChooseViewController()
                chooseViewController.modalPresentationStyle = .automatic
                self.present(chooseViewController, animated: true)
            }
            .disposed(by: disposeBag)
    }
}

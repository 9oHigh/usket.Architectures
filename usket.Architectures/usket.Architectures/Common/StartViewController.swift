//
//  ChooseViewController.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/03.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class StartViewController: BaseViewController, BaseInitializing {
    
    private let architectureStackView = UIStackView()
    private let mvcButton = UIButton()
    private let mvvmButton = UIButton()
    private let mvpButton = UIButton()
    private let viperButton = UIButton()
    private let ribsButton = UIButton()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
        setUI()
        setConstraints()
        setBinding()
    }
    
    func setConfig() {
        architectureStackView.setArchitectureStackView()
        mvcButton.setArchitectureButton(title: "MVC")
        mvvmButton.setArchitectureButton(title: "MVVM")
        mvpButton.setArchitectureButton(title: "MVP")
        viperButton.setArchitectureButton(title: "VIPER")
        ribsButton.setArchitectureButton(title: "RIBs")
    }
    
    func setUI() {
        view.addSubview(architectureStackView)
        architectureStackView.addArrangedSubview(mvcButton)
        architectureStackView.addArrangedSubview(mvvmButton)
        architectureStackView.addArrangedSubview(mvpButton)
        architectureStackView.addArrangedSubview(viperButton)
        architectureStackView.addArrangedSubview(ribsButton)
    }
    
    func setConstraints() {

        architectureStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    func setBinding() {
        mvcButton.rx.tap.bind {
            let viewController = UserInfoViewController()
            self.pushNextViewController(viewController, animated: true)
        }
        .disposed(by: disposeBag)
        
        mvvmButton.rx.tap.bind {
            
        }
        .disposed(by: disposeBag)
        
        mvpButton.rx.tap.bind {
            
        }
        .disposed(by: disposeBag)
        
        viperButton.rx.tap.bind {
            
        }
        .disposed(by: disposeBag)
        
        ribsButton.rx.tap.bind {
            
        }
        .disposed(by: disposeBag)
    }
}

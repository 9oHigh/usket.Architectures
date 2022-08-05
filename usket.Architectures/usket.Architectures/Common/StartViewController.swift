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
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
        setUI()
        setConstraints()
        setBinding()
    }
    
    func setConfig() {
        architectureStackView.setArchitectureStackView(names: ["MVC", "MVVM", "MVP", "VIPER", "RIBs"], verticalSpacing: 20)
    }
    
    func setUI() {
        view.addSubview(architectureStackView)
    }
    
    func setConstraints() {
        architectureStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    func setBinding() {
        guard let architectureButtons = architectureStackView.arrangedSubviews as? [UIButton] else { return }
        
        let taps = architectureButtons.enumerated().map { ($0.0, $0.1.rx.tap) }
        let toInts = taps.map { index, obs in obs.map { index } }
        let mergedTaps = Observable.merge(toInts)
        
        mergedTaps.subscribe(onNext: { tag in
            switch tag {
            case 0:
                let viewController = UserInfoViewController()
                self.pushToNextViewController(viewController)
            case 1:
                let viewController = UserInfoViewController()
                self.pushToNextViewController(viewController)
            case 2:
                let viewController = UserInfoViewController()
                self.pushToNextViewController(viewController)
            case 3:
                let viewController = UserInfoViewController()
                self.pushToNextViewController(viewController)
            case 4:
                let viewController = UserInfoViewController()
                self.pushToNextViewController(viewController)
            default:
                return
            }
        })
        .disposed(by: disposeBag)

    }
}

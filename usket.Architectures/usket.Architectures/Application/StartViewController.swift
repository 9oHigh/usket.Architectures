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
        architectureStackView.setArchitectureStackView(names: ["MVC", "MVVM", "MVP", "VIPER", "RIBS"], nextPages: NextPage.allCases, verticalSpacing: 20)
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
    
    private func setBinding() {
        guard let architectureButtons = architectureStackView.arrangedSubviews as? [ArchitectureButton] else { return }
        
        let taps = architectureButtons.enumerated().map { ($0.element.nextPage, $0.1.rx.tap) }
        let toNextPage = taps.map { nextPage, obs in obs.map { nextPage } }
        let mergedTaps = Observable.merge(toNextPage)
        
        mergedTaps.subscribe(onNext: { nextPage in
            switch nextPage {
            case .mvc:
                let viewController = UserInfoViewController()
                let title = nextPage?.rawValue.uppercased()
                self.pushToNextViewController(title: title,viewController)
            case .mvvm:
                let viewController = EmployeesViewController()
                let title = nextPage?.rawValue.uppercased()
                self.pushToNextViewController(title: title,viewController)
            case .mvp:
                let viewController = EmojiViewController()
                let title = nextPage?.rawValue.uppercased()
                self.pushToNextViewController(title: title,viewController)
            case .viper:
                let viewController = KeyboardViewController()
                let title = nextPage?.rawValue.uppercased()
                self.pushToNextViewController(title: title,viewController)
            case .ribs:
                let viewController = UserInfoViewController()
                let title = nextPage?.rawValue.uppercased()
                self.pushToNextViewController(title: title,viewController)
            case .none:
                return
            }
        })
        .disposed(by: disposeBag)
    }
}

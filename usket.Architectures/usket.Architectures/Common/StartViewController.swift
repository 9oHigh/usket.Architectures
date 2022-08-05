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
        
    }
}

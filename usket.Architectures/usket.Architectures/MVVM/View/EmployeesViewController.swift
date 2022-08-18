//
//  LoginViewController.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/11.
//

import UIKit
import RxSwift
import RxCocoa

final class EmployeesViewController: BaseViewController, BaseInitializing {
    
    private let employeesTableView: UITableView = UITableView()
    private let employeesFetchButton = EmployeesButton()
    
    private let viewModel = EmployeesViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
        setUI()
        setConstraints()
        bind()
    }
    
    func setConfig() {
        employeesTableView.backgroundColor = .white
        employeesTableView.separatorStyle = .none
        employeesTableView.rowHeight = 100
        employeesTableView.register(EmployeesTableViewCell.self, forCellReuseIdentifier: EmployeesTableViewCell.identifier)
    }
    
    func setUI() {
        view.addSubview(employeesFetchButton)
        view.addSubview(employeesTableView)
    }
    
    func setConstraints() {
        
        employeesFetchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(62)
        }
        
        employeesTableView.snp.makeConstraints { make in
            make.top.equalTo(employeesFetchButton.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.bottom.equalToSuperview()
        }
    }
    
    func bind() {
        employeesFetchButton.rx.tap
            .bind(to: viewModel.input.loadTrigger)
            .disposed(by: disposeBag)
        
        viewModel.output.employeesList
            .bind(to: employeesTableView.rx.items(cellIdentifier: EmployeesTableViewCell.identifier, cellType: EmployeesTableViewCell.self)) { row, element, cell in
                cell.employeeInfoView.setEmployeeInfo(name: element.employeeName, age: element.employeeAge, salary: element.employeeSalary)
            }
            .disposed(by: disposeBag)
    }
}

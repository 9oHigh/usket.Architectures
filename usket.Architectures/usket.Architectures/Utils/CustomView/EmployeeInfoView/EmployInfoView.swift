//
//  EmployInfoView.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/18.
//

import UIKit

final class EmployeeInfoView: UIView, BaseInitializing {
    
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let salaryLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfig()
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfig() {
        nameLabel.textColor = .black
        ageLabel.textColor = .black
        salaryLabel.textColor = .black
        
        nameLabel.font = .boldSystemFont(ofSize: 14)
        ageLabel.font = .boldSystemFont(ofSize: 14)
        salaryLabel.font = .boldSystemFont(ofSize: 14)
    }
    
    func setUI() {
        addSubview(nameLabel)
        addSubview(ageLabel)
        addSubview(salaryLabel)
    }
    
    func setConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(8)
            make.bottom.equalTo(ageLabel.snp.top)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.equalTo(8)
            make.centerY.equalToSuperview()
            make.bottom.equalTo(salaryLabel.snp.top)
        }
        
        salaryLabel.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom)
            make.leading.equalTo(8)
            make.bottom.equalToSuperview()
        }
    }
    
    func setEmployeeInfo(name: String, age: Int, salary: Int){
        nameLabel.text = "Name: " + name
        ageLabel.text = "Age: " + String(age)
        salaryLabel.text = "Salary: " + salary.numberFormattedNumber
    }
}

//
//  EmployeesTableViewCell.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/17.
//

import UIKit

final class EmployeesTableViewCell: UITableViewCell, BaseInitializing {

    static let identifier: String = "EmployeesTableViewCell"
    let employeeInfoView = EmployeeInfoView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConfig()
        setUI()
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 이걸 사용하려면 addSubView를 ContentView로 해주어야함
        // 또한 border도 contentView에 설정
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setConfig() {
        selectionStyle = .none
        backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
    }
    
    func setUI() {
        contentView.addSubview(employeeInfoView)
    }
    
    func setConstraints() {
        employeeInfoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

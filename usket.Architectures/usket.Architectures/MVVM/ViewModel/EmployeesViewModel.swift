//
//  EmployeesViewModel.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/13.
//

import Foundation
import RxSwift
import RxRelay

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}

final class EmployeesViewModel: ViewModelType {
    
    struct Input {
        let loadTrigger = PublishSubject<Void>()
    }
    
    struct Output {
        let employeesList = BehaviorRelay<[Datum]>(value: [])
    }
    
    var input: Input
    var output: Output
    
    private let apiService: APIService
    private let disposeBag = DisposeBag()
    
    init(input: Input = Input(), output: Output = Output(), apiService: APIService = APIService()) {
        self.input = input
        self.output = output
        self.apiService = apiService
    }
    
    func fetchEmployees() {
        apiService.requestEmployees { [weak self] source in
            self?.output.employeesList.accept(source.data)
        }
    }
    
    func setLoadTrigger() {

    }
}

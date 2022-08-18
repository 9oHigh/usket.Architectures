//
//  Int + Extension.swift
//  usket.Architectures
//
//  Created by 이경후 on 2022/08/18.
//

import Foundation

extension Int {

    var numberFormattedNumber: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}

//
//  Double+rounded.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 05.05.2021.
//

import Foundation

extension Double {
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}

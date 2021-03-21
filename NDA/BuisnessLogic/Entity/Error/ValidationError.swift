//
//  ValidationError.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 21.03.2021.
//

import Foundation

enum ValidationError: LocalizedError {
    case wrongName
    case wrongAge
    case wrongEmail
    case emtyField
    
    var errorDescription: String? {
        switch self {
        case .wrongName:
            return "Name must contains only letters"
        case .wrongAge:
            return "Age is to much"
        case .wrongEmail:
            return "Wrong email"
        case .emtyField:
            return "Field is empty"
        }
    }
}

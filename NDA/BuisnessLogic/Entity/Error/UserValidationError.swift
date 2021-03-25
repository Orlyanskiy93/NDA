//
//  ValidationError.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 21.03.2021.
//

import Foundation

enum UserValidationError: LocalizedError {
    case wrongName
    case wrongAge
    case wrongEmail
    case emtyField
    
    var errorDescription: String? {
        switch self {
        case .wrongName:
            return String.Error.wrongName
        case .wrongAge:
            return String.Error.wrongAge
        case .wrongEmail:
            return String.Error.wrongEmail
        case .emtyField:
            return String.Error.emptyField
        }
    }
}

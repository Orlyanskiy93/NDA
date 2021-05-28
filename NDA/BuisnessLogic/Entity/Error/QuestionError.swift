//
//  QuestionError.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 30.03.2021.
//

import Foundation

enum QuestionError: LocalizedError {
    case rightAnswer
    case mapping
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .rightAnswer:
            return String.Error.rightAnswer
        case .mapping:
            return String.Error.mapping
        case .custom(let string):
            return string
        }
    }
}

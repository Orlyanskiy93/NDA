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
    
    var errorDescription: String? {
        switch self {
        case .rightAnswer:
            return String.Error.rightAnswer
        case .mapping:
            return "" //TODO: String
        }
    }
}

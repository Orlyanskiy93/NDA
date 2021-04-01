//
//  QuestionError.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 30.03.2021.
//

import Foundation

enum QuestionError: LocalizedError {
    case wrongAnswerCount
    
    var errorDescription: String? {
        switch self {
        case .wrongAnswerCount:
            return "Wrong count of answers"
        }
    }
}

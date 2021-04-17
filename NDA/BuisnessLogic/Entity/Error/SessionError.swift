//
//  SessionError.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 16.04.2021.
//

import Foundation

enum SessionError: LocalizedError {
    case gfIndex
    case completion
    case `continue`
    case saving
    
    var errorDescription: String? {
        switch self {
        case .gfIndex:
            return String.Error.rightAnswer
        case .completion:
            return String.Error.completion
        case .continue:
            return String.Error.continueSession
        case .saving:
            return String.Error.savingSession
        }
    }
}

//
//  SessionError.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 16.04.2021.
//

import Foundation

enum SessionError: LocalizedError {
    case saving
    case stage
    
    var errorDescription: String? {
        switch self {
        case .saving:
            return String.Error.savingSession
        case .stage:
            return String.Error.stage
        }
    }
}

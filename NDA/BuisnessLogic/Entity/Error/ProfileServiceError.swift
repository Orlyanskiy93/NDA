//
//  ProfileServiceError.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 23.03.2021.
//

import Foundation

enum ProfileServiceError: LocalizedError {
    case saveUser
    case getUser
    
    var errorDescription: String? {
        switch self {
        case .saveUser:
            return String.Error.saveUser
        case.getUser:
            return String.Error.getUser
        }
    }
}

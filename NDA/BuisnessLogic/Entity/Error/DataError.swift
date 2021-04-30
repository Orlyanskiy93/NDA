//
//  DataError.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.04.2021.
//

import Foundation

enum DataError: LocalizedError {
    case save
    case fetch
    case maping
    
    var errorDescription: String? {
        switch self {
        case .save:
            return String.Error.saveData
        case .fetch:
            return String.Error.fetchData
        case .maping:
            return String.Error.mapData
        }
    }
}

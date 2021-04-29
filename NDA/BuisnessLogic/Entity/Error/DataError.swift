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
    
    //TODO:
    var errorDescription: String? {
        switch self {
        case .save:
            return "Unable to save data"
        case .fetch:
            return "Unable to fetch data"
        case .maping:
            return "Unable to map data"
        }

    }
}

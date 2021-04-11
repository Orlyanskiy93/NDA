//
//  Answer.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 30.03.2021.
//

import Foundation

struct Option {
    var value: String
    var isRight: Bool
    var type: OptionType

    init(value: String, type: OptionType, isRight: Bool = false) {
        self.value = value
        self.isRight = isRight
        self.type = type
    }
}

enum OptionType {
    case image
    case text
}

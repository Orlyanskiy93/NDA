//
//  Strings.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.03.2021.
//

import Foundation

extension String {
    struct Error {
        static let error = "Error"
        static let ok = "Ok"
        static let wrongName = "Name must contains only letters"
        static let wrongAge = "Age is to much"
        static let wrongEmail = "Wrong email"
        static let emptyField = "Field is empty"
        static let saveUser = "Unable to save user"
        static let getUser = "Unable to load user"
    }
}

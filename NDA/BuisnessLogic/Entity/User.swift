//
//  User.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 20.03.2021.
//

import Foundation

struct User: Codable {
    static var key = "user"
    var name: String
    var age: String
    var email: String
    
    func validate() throws {
        let isContains = name.contains(where: { (character) -> Bool in
            return character.isNumber || character.isPunctuation || character.isSymbol
        })
        if isContains {
            throw UserValidationError.wrongName
        }
        guard !name.isEmpty, let age = Int(age), !email.isEmpty else {
            throw UserValidationError.emtyField
        }
        let maxAge = 110
        if age > maxAge {
            throw UserValidationError.wrongAge
        }        
        if !email.contains("@") {
            throw UserValidationError.wrongEmail
        }
    }
}

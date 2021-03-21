//
//  User.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 20.03.2021.
//

import Foundation

struct User {
    var name: String
    var age: String
    var email: String
    
    
    func validate() throws {
        if name.contains(where: { (character) -> Bool in
            return character.isNumber && character.isSymbol
        }) {
            throw ValidationError.wrongName
        }
        if name.isEmpty {
            throw ValidationError.emtyField
        }
        guard let age = Int(age) else {
            throw ValidationError.emtyField
        }
        if age > 110 {
            throw ValidationError.wrongAge
        }        
        if !email.contains("@") {
            throw ValidationError.wrongEmail
        }
        if email.isEmpty {
            throw ValidationError.emtyField
        }
    }
}

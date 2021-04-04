//
//  LoginService.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 20.03.2021.
//

import Foundation

protocol ProfileService {
    func add(_ user: User) throws
    func getUser() throws -> User
    func removeUser()
}

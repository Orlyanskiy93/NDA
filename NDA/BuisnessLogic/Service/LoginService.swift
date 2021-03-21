//
//  LoginService.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 20.03.2021.
//

import Foundation

protocol LoginService {
    func add(_ user: User)
    func remove(_ user: User)
}

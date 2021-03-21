//
//  LoginLoginInteractor.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class LoginInteractor: LoginInteractorInput {
    var loginService: LoginService!
    weak var output: LoginInteractorOutput!
    
    func save(_ user: User) {
        loginService.add(user)
    }
}

//
//  EditProfileEditProfileInteractor.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class EditProfileInteractor: EditProfileInteractorInput {
    weak var output: EditProfileInteractorOutput!
    var loginService: LoginService!
    
    func save(_ user: User) {
        loginService.add(user)
    }
}

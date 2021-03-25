//
//  LoginLoginInteractor.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class LoginInteractor: LoginInteractorInput {
    var profileService: ProfileService!
    weak var output: LoginInteractorOutput!

    func save(_ user: User) {
        do {
            try profileService.add(user)
        } catch {
            output.handle(error)
        }
    }
}

//
//  ProfileProfileInteractor.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class ProfileInteractor: ProfileInteractorInput {
    weak var output: ProfileInteractorOutput!
    var loginService: LoginService!
    
    func loadUser(){
        output.user = loginService.getUser()
    }
}

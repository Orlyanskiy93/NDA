//
//  EditProfileEditProfileInteractor.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class EditProfileInteractor: EditProfileInteractorInput {
    weak var output: EditProfileInteractorOutput!
    var profileService: ProfileService!
    
    func save(_ user: User) {
        do {
            try profileService.add(user)
        } catch {
            output.handle(error)
        }
    }
}

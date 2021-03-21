//
//  EditProfileEditProfilePresenter.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class EditProfilePresenter: EditProfileModuleInput, EditProfileViewOutput, EditProfileInteractorOutput {

    weak var view: EditProfileViewInput!
    var interactor: EditProfileInteractorInput!
    var router: EditProfileRouterInput!

    func viewIsReady() {

    }
}

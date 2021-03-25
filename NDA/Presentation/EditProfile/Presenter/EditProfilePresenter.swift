//
//  EditProfileEditProfilePresenter.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class EditProfilePresenter: NSObject, EditProfileModuleInput, EditProfileViewOutput, EditProfileInteractorOutput {
    weak var view: EditProfileViewInput!
    var interactor: EditProfileInteractorInput!
    var router: EditProfileRouterInput!
    var user: User!

    func viewIsReady() {
        view.setupInitialState()
        view.fill(with: user)
    }

    func edit(_ user: User) {
        do {
            try user.validate()
            interactor.save(user)
            router.returnToProfileModule()
        } catch {
            view.show(error)
        }
    }

    func set(_ user: User) {
        self.user = user
    }
    
    func handle(_ error: Error) {
        view.show(error)
    }
}

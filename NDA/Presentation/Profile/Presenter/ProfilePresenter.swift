//
//  ProfileProfilePresenter.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class ProfilePresenter: ProfileModuleInput, ProfileViewOutput, ProfileInteractorOutput {
    weak var view: ProfileViewInput!
    var interactor: ProfileInteractorInput!
    var router: ProfileRouterInput!
    var user: User!
        
    func viewIsReady() {
        view.setupInitialState()
        loadUser()
    }
    
    func loadUser() {
        interactor.loadUser()
        view.fillLabelsBy(user)
    }
    
    func openEditScreen() {
        router.openEditProfileModuleWith(user)
    }
    
    func openLoginScreen() {
        router.openLoginModule()
    }
}

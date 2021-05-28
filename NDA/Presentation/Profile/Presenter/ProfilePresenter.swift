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
    var mainRouter = MainRouter.shared
    var user: User!
        
    func viewIsReady() {
        view.setupInitialState()
        loadUser()
    }
    
    func loadUser() {
        user = interactor.loadUser()
        view.fillLabels(with: user)
    }
    
    func removeUserAndHistory() {
        view.show(title: nil , message: String.History.removeProfile) { [weak self] _ in
            self?.interactor.removeUser()
            self?.mainRouter.open(module: .login)
        }
    }
    
    func openEditScreen() {
        router.openEditProfileModule(with: user)
    }
    
    func openLoginScreen() {
        router.openLoginModule()
    }
    
    func handle(_ error: Error) {
        view.show(error)
    }
}

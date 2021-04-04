//
//  LoginLoginPresenter.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class LoginPresenter: LoginModuleInput, LoginViewOutput, LoginInteractorOutput {

    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!
    lazy var mainRouter = MainRouter.shared

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func login(_ user: User) {
        do {
            try user.validate()
            interactor.save(user)
            mainRouter.open(module: .main)
        } catch {
            view.show(error)
        }
    }
    
    func handle(_ error: Error) {
        view.show(error)
    }
}

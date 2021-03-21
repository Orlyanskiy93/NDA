//
//  LoginLoginRouter.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import ViperMcFlurry

class LoginRouter: LoginRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openProfile() {
        let promise = transitionHandler.openModule?(usingSegue: "profileSegue")
        promise?.thenChain({ (moduleInput) -> RamblerViperModuleOutput? in
            return nil
        })
    }
}

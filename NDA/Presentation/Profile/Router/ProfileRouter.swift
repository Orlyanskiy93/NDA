//
//  ProfileProfileRouter.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import ViperMcFlurry

class ProfileRouter: ProfileRouterInput {    
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openEditProfileModuleWith(_ user: User) {
        let promise = transitionHandler.openModule?(usingSegue: "editProfileSegue")
        promise?.thenChain({ (moduleInput) -> RamblerViperModuleOutput? in
            (moduleInput as? EditProfileModuleInput)?.set(user)
            return nil
        })
    }
    
    func openLoginModule() {
        let promise = transitionHandler.openModule?(usingSegue: "loginSegue")
        promise?.thenChain({ (moduleInput) -> RamblerViperModuleOutput? in
            return nil
        })
    }
}

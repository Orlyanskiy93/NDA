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
    
    func openEditProfileModule(with user: User) {
        let promise = transitionHandler.openModule?(usingSegue: "editProfileSegue")
        promise?.thenChain({ (moduleInput) -> RamblerViperModuleOutput? in
            let editProfileModuleInput = moduleInput as? EditProfileModuleInput
            editProfileModuleInput?.set(user)
            return nil
        })
    }
    
    func openLoginModule() {
        _ = transitionHandler.openModule?(usingSegue: "loginSegue")
    }
}

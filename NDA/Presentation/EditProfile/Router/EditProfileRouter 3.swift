//
//  EditProfileEditProfileRouter.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import ViperMcFlurry

class EditProfileRouter: EditProfileRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func returnToProfileModule() {
        transitionHandler.closeCurrentModule?(true)
    }
}

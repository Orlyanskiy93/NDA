//
//  HomeHomeRouter.swift
//  NDA
//
//  Created by Dmitriy on 25/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import ViperMcFlurry

class HomeRouter: HomeRouterInput {
    
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openInformationScreen() {
        _ = transitionHandler.openModule?(usingSegue: "informationScreenSegue")
    }
}

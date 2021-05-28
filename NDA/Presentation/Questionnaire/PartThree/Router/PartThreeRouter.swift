//
//  PartThreePartThreeRouter.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import ViperMcFlurry
class PartThreeRouter: PartThreeRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openEndScreen() {
        _ = transitionHandler.openModule?(usingSegue: "endSegue")
    }
}

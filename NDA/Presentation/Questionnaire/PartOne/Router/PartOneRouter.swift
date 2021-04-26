//
//  PartOnePartOneRouter.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import ViperMcFlurry

class PartOneRouter: PartOneRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openPartTwo() {
        _ = transitionHandler.openModule?(usingSegue: "nextPartSegue")
    }
}

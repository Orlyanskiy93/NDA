//
//  PartTwoPartTwoRouter.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import ViperMcFlurry

class PartTwoRouter: PartTwoRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openPartThree() {
        _ = transitionHandler.openModule?(usingSegue: "partThreeSegue")
    }
}

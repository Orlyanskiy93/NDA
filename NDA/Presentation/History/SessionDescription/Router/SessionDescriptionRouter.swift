//
//  SessionDescriptionSessionDescriptionRouter.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import ViperMcFlurry

class SessionDescriptionRouter: SessionDescriptionRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openPartOneDetails(with session: Session) {
        let promise = transitionHandler.openModule?(usingSegue: "partOneDetailsSegue")
        promise?.thenChain({ (moduleInput) -> RamblerViperModuleOutput? in
            (moduleInput as?  PartOneDetailsModuleInput)?.load(session)
            return nil
        })
    }
    
    func openPartTwoDetails(with session: Session) {
        let promise = transitionHandler.openModule?(usingSegue: "partTwoDetailsSegue")
        promise?.thenChain({ (moduleInput) -> RamblerViperModuleOutput? in
            (moduleInput as? PartTwoDetailsModuleInput)?.load(session)
            return nil
        })
    }
    
    func openPartThreeDetails(with session: Session) {
        let promise = transitionHandler.openModule?(usingSegue: "partThreeDetailsSegue")
        promise?.thenChain({ (moduleInput) -> RamblerViperModuleOutput? in
            (moduleInput as? PartThreeDetailsModuleInput)?.load(session)
            return nil
        })
    }
}

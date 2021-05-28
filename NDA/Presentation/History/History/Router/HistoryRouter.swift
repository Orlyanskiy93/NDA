//
//  HistoryHistoryRouter.swift
//  NDA
//
//  Created by Dmitriy on 17/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import ViperMcFlurry

class HistoryRouter: HistoryRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openSessionDescription(_ session: Session) {
        let promise = transitionHandler.openModule?(usingSegue: "sessionDescriptionSegue")
        promise?.thenChain({ (moduleInput) -> RamblerViperModuleOutput? in
            (moduleInput as? SessionDescriptionModuleInput)?.load(session)
            return nil
        })
    }
}

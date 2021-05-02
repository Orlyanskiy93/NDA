//
//  QuestionnaireEndScreenQuestionnaireEndScreenRouter.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import  ViperMcFlurry

class ResultsRouter: ResultsRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openHomeScreen() {
        _ = transitionHandler.openModule?(usingSegue: "toHomeSegue")
    }
}

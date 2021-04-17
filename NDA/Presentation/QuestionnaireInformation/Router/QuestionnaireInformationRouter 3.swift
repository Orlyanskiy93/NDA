//
//  QuestionnaireInformationQuestionnaireInformationRouter.swift
//  NDA
//
//  Created by Dmitriy on 01/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import ViperMcFlurry

class QuestionnaireInformationRouter: QuestionnaireInformationRouterInput {
    
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openPartOneModule() {
        _ = transitionHandler.openModule?(usingSegue: "partOneSegue")
    }
    
    func openPartTwoModule() {
        _ = transitionHandler.openModule?(usingSegue: "partTwoSegue")
    }
}

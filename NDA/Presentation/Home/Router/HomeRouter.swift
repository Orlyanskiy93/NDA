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
    
    func openPartOne() {
        _ = transitionHandler.openModule?(usingSegue: "partOneSegue")
    }
    
    func openPartTwo() {
        _ = transitionHandler.openModule?(usingSegue: "partTwoSegue")
    }
    
    func openPartThree() {
        _ = transitionHandler.openModule?(usingSegue: "partThreeSegue")
    }
}

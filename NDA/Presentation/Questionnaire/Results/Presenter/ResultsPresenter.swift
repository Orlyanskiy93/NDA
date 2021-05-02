//
//  QuestionnaireEndScreenQuestionnaireEndScreenPresenter.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class ResultsPresenter: NSObject, ResultsModuleInput,
                                       ResultsViewOutput,
                                       ResultsInteractorOutput {

    weak var view: ResultsViewInput!
    var interactor: ResultsInteractorInput!
    var router: ResultsRouterInput!

    func viewIsReady() {
        let session = interactor.loadSession()
        view.fill(with: session.score)
    }
    
    func handle(_ error: Error) {
        view.show(title: error.localizedDescription, message: String.Error.tryAgain)
        //TODO:
    }
    
    func goToHomeScreen() {
        router.openHomeScreen()
    }
}

//
//  QuestionnaireEndScreenQuestionnaireEndScreenPresenter.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class ResultsPresenter: NSObject, ResultsModuleInput, ResultsViewOutput, ResultsInteractorOutput {

    weak var view: ResultsViewInput!
    var interactor: ResultsInteractorInput!
    var router: ResultsRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        let session = interactor.loadSession()
        view.fill(with: session.score)
    }
    
    func handle(_ error: Error) {
        view.show(error) { [weak self] _ in
            self?.viewIsReady()
        }
    }
    
    func goToHomeScreen() {
        interactor.finishSession()
        router.openHomeScreen()
    }
}

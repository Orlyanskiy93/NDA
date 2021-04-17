//
//  QuestionnaireEndScreenQuestionnaireEndScreenPresenter.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class QuestionnaireEndScreenPresenter: NSObject, QuestionnaireEndScreenModuleInput,
                                       QuestionnaireEndScreenViewOutput,
                                       QuestionnaireEndScreenInteractorOutput {

    weak var view: QuestionnaireEndScreenViewInput!
    var interactor: QuestionnaireEndScreenInteractorInput!
    var router: QuestionnaireEndScreenRouterInput!

    func viewIsReady() {
        view.fill(with: interactor.loadScore())
    }
    
    func handle(_ error: Error) {
        view.show(title: error.localizedDescription, message: String.Error.tryAgain)
        view.fill(with: interactor.loadScore())
    }
}

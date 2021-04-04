//
//  QuestionnaireInformationQuestionnaireInformationPresenter.swift
//  NDA
//
//  Created by Dmitriy on 01/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class QuestionnaireInformationPresenter: QuestionnaireInformationModuleInput, QuestionnaireInformationViewOutput, QuestionnaireInformationInteractorOutput {

    weak var view: QuestionnaireInformationViewInput!
    var interactor: QuestionnaireInformationInteractorInput!
    var router: QuestionnaireInformationRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func loadQuestionnaire() {
        router.openPartOneModule()
    }
}

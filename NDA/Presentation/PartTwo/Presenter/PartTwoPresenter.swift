//
//  PartTwoPartTwoPresenter.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class PartTwoPresenter: PartTwoModuleInput, PartTwoViewOutput, PartTwoInteractorOutput {
    weak var view: PartTwoViewInput!
    var interactor: PartTwoInteractorInput!
    var router: PartTwoRouterInput!
    var index = 0

    func viewIsReady() {
        view.setupProgressView(with: interactor.questions)
        view.setupInitialState()
        loadQuestion()
    }
    
    func loadQuestion() {
        let question = interactor.questions[index]
        if question.type == .image {
            view.fillButtonsBackground(with: question)
        } else {
            view.fillButtonsTitle(with: question)
        }
    }
    
    func nextQuestion() {
        if (index + 1) != interactor.questions.count {
            index += 1
            loadQuestion()
        } else {
        }
    }
}

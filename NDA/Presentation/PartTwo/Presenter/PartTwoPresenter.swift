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
    var index: Int = 0

    func viewIsReady() {
        view.setupInitialState()
        loadQuestion()
    }
    
    func loadQuestion() {
        let question = interactor.questions[index]
        if question.type == .image {
            view.fillImageViews(with: question)
        } else {
            view.fillButtons(with: question)
        }
    }
    
    func nextQuestion() {
        if index + 1 != interactor.questions.count {
            index += 1
            let progressValue = Float(index) / Float(interactor.questions.count)
            view.updateProgressView(with: progressValue)
            loadQuestion()
        } else {
        }
    }
}

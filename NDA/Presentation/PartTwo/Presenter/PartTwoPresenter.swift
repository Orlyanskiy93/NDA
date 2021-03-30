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
        loadQuestion()
    }
    
    func loadQuestion() {
        let question = interactor.questions[index]

        let contains = question.answers?.first?.contains(where: { (character) -> Bool in
            return character.isNumber
        })
        guard let isTextAnswer = contains else {
            return
        }
        if isTextAnswer {
            view.fillButtonsTitle(with: question)
        } else {
            view.fillButtonsBackground(with: question)
        }
    }
    
    func nextQuestion() {
        if index + 1 != interactor.questions.count {
            index += 1
            loadQuestion()
        } else {
        }
    }
}

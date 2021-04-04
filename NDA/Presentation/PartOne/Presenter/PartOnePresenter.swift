//
//  PartOnePartOnePresenter.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class PartOnePresenter: NSObject, PartOneModuleInput, PartOneViewOutput, PartOneInteractorOutput {
    weak var view: PartOneViewInput!
    var interactor: PartOneInteractorInput!
    var router: PartOneRouterInput!
    var answers = [AnswerPartOne]()
    var index: Int = 0

    func viewIsReady() {
        view.setupInitialState()
        view.show(interactor.questions[index])
    }
        
    func answerDidChosen(with value: Int) {
        if index + 1 != interactor.questions.count {
            index += 1
            let progressValue = 1 / Float(interactor.questions.count)
            view.updateProgressView(with: progressValue)
            view.show(interactor.questions[index])
            let answer = AnswerPartOne(question: interactor.questions[index], value: value)
            answers.append(answer)
        } else {
            router.openPartTwo()
        }
    }
}

//
//  PartOnePartOnePresenter.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class PartOnePresenter: PartOneModuleInput, PartOneViewOutput, PartOneInteractorOutput {
    weak var view: PartOneViewInput!
    var interactor: PartOneInteractorInput!
    var router: PartOneRouterInput!
    var questions = [QuestionPartOne]()
    var answers = [AnswerPartOne]()
    var index: Int = 0

    func viewIsReady() {
        questions = interactor.loadQuestions()
        view.setupInitialState()
        view.show(questions[index])
    }
        
    // value
    func answerDidChosen(with sliderValue: Int) {
        if index + 1 != questions.count {
            index += 1
            view.show(questions[index])
            let answer = AnswerPartOne(question: questions[index], value: sliderValue)
            answers.append(answer)
        } else {
            print(answers)
        }
    }
}

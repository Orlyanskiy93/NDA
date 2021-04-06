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
        let firstQuestion = interactor.questions[index]
        view.show(firstQuestion)
    }
    
    func saveAnswer(question: QuestionPartOne, value: Int) {
        let answer = AnswerPartOne(question: question, value: value)
        answers.append(answer)
    }
    
    func answerDidChosen(with value: Int) {
        if index + 1 != interactor.questions.count {
            let currentQuestion = interactor.questions[index]
            saveAnswer(question: currentQuestion, value: value)
            
            index += 1
            
            let progressValue = Float(index) / Float(interactor.questions.count)
            view.updateProgressView(with: progressValue)
            
            let nextQuestion = interactor.questions[index]
            view.show(nextQuestion)
        } else {
            router.openPartTwo()
        }
    }
}

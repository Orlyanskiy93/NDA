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
    var questions: [QuestionPartOne]!
    var answers: [AnswerPartOne] = []
    var index: Int = 0

    func viewIsReady() {
        questions = interactor.questions
        view.setupInitialState()
        let firstQuestion = questions[index]
        view.show(firstQuestion)
    }
        
    func answerDidChosen(with value: Int) {
        let currentQuestion = questions[index]
        let answer = AnswerPartOne(question: currentQuestion, value: value)
        answers.append(answer)
        
        if index + 1 < questions.count {
            index += 1
            
            let progressValue = Float(index) / Float(questions.count)
            view.updateProgressView(with: progressValue)
            
            let nextQuestion = questions[index]
            view.show(nextQuestion)
        } else {
            interactor.save(answers)
            router.openPartTwo()
        }
    }
}

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
    var chosenQuestionNumber: Int = 0
    var questionNumber: Int = 0 {
        didSet {
            chosenQuestionNumber = questionNumber
        }
    }

    func viewIsReady() {
        questions = interactor.questions
        view.setupInitialState(with: questions.count)
        let firstQuestion = questions[chosenQuestionNumber]
        view.show(firstQuestion)
    }
    
    func saveAnswer(with question: QuestionPartOne, answerValue: Int) {
        let currentAnswer = AnswerPartOne(question: question, value: answerValue)
        guard let index = answers.firstIndex(where: { answer in
            return answer.question == currentAnswer.question
        }) else {
            answers.append(currentAnswer)
            return
        }
        answers[index] = currentAnswer
    }
        
    func answerDidChosen(with value: Int) {
        saveAnswer(with: questions[chosenQuestionNumber], answerValue: value)
        
        if questionNumber + 1 < questions.count {
            
            if questionNumber == chosenQuestionNumber {
                questionNumber += 1
                let progressValue = Float(questionNumber) / Float(questions.count)
                view.updateProgressView(with: progressValue)
                let nextQuestion = questions[questionNumber]
                view.show(nextQuestion)
            } else {
                chosenQuestionNumber = questionNumber
                let nextQuestion = questions[questionNumber]
                view.show(nextQuestion)
            }
        } else {
            interactor.save(answers)
            router.openPartTwo()
        }
    }
    
    func editQuestion(with number: Int) {
        chosenQuestionNumber = number
        guard let index = answers.firstIndex(where: { answer in
            return answer.question == questions[chosenQuestionNumber]
        }) else {
            return
        }
        let question = answers[index].question
        let answerValue = answers[index].value
        view.showEditing(question, with: Float(answerValue))
    }
    
    func handle(_ error: Error) {
        view.show(error) { [weak self] _ in
            self?.viewIsReady()
        }
    }
}

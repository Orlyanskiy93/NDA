//
//  PartTwoPartTwoPresenter.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoPresenter: PartTwoModuleInput, PartTwoViewOutput, PartTwoInteractorOutput {
    weak var view: PartTwoViewInput!
    var interactor: PartTwoInteractorInput!
    var router: PartTwoRouterInput!
    
    var questions: [QuestionPartTwo] = []
    var answers: [AnswerPartTwo] = []
    var chosenQuestion: Int = 0
    var startingTime: Date = Date()
    
    func viewIsReady() {
        questions = interactor.questions
        view.setup(with: questions.count)
        loadQuestion()
    }
    
    func loadQuestion() {
        startingTime = Date()
        let question = questions[chosenQuestion]
        if question.type == .image {
            view.fillImageViews(with: question)
        } else {
            view.fillButtons(with: question)
        }
    }
    
    func saveAnswer(with chosenOption: Option) {
        let question = questions[chosenQuestion].title
        let chosenOption = chosenOption
        let time = Date().timeIntervalSince(startingTime)
        let answer = AnswerPartTwo(question: question!, option: chosenOption, time: time)
        answers.append(answer)
    }
    
    func didChosen(_ option: Option) {
        saveAnswer(with: option)
        
        if chosenQuestion + 1 != questions.count {
            chosenQuestion += 1
            let progressValue = Float(chosenQuestion) / Float(questions.count)
            view.updateProgressView(with: progressValue)
            loadQuestion()
        } else {
            interactor.save(answers)
            router.openPartThree()
        }
    }
    
    func handle(_ error: Error) {
        view.show(error) { [weak self] _ in
            self?.viewIsReady()
        }
    }
}

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
    var index: Int = 0
    var startingTime: Date = Date()
    
    func viewIsReady() {
        questions = interactor.questions
        view.setupInitialState()
        loadQuestion()
    }
    
    func loadQuestion() {
        startingTime = Date()
        let question = questions[index]
        if question.type == .image {
            view.fillImageViews(with: question)
        } else {
            view.fillButtons(with: question)
        }
    }
    
    func saveAnswer(with chosenOption: Option) {
        let question = questions[index].title
        let chosenOption = chosenOption
        let time = Date().timeIntervalSince(startingTime)
        let answer = AnswerPartTwo(question: question!, option: chosenOption, time: time)
        interactor.save(answer)
    }
    
    func didChosen(_ option: Option) {
        saveAnswer(with: option)
        
        if index + 1 != questions.count {
            index += 1
            let progressValue = Float(index) / Float(questions.count)
            view.updateProgressView(with: progressValue)
            loadQuestion()
        } else {
            router.openPartThree()
        }
    }
    
    func handle(_ error: Error) {
        view.show(title: String.Error.error, message: String.Error.tryAgain) { [weak self] (_) in
            self?.loadQuestion()
        }
    }
}

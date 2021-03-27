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
    var questions = [Question]()
    var index = 0
    var score: Int = 0

    func viewIsReady() {
        questions = interactor.loadQuestions()
        view.setupInitialState()
        view.show(questions[index])
    }
    
    func nextQuestion() {
        if index + 1 != questions.count {
            index += 1
            view.show(questions[index])
        } else {
            //TODO: Open Part 2
        }
    }
}

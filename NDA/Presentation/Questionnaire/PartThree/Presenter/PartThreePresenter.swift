//
//  PartThreePartThreePresenter.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation
import PromiseKit

class PartThreePresenter: PartThreeModuleInput, PartThreeViewOutput, PartThreeInteractorOutput {
    weak var view: PartThreeViewInput!
    var interactor: PartThreeInteractorInput!
    var router: PartThreeRouterInput!
    var question: QuestionPartThree!
    var gfIndex: Double = 0.0

    func viewIsReady() {
        question = interactor.question
        view.fill(with: question)
    }
                    
    func isValide(_ text: String) -> Bool {
        guard !text.isEmpty else {
            view.show(message: String.Error.emptyField)
            return false
        }
        guard text.count >= 20 else {
            view.show(message: String.Error.shortText)
            return false
        }
        return true
    }
    
    func didRecived(_ answer: String) {
        if isValide(answer) {
            interactor.loadGunningFogIndex(answer)
        }
    }
    //TODO: названия
    func save(_ answer: String) {
        let answer = AnswerPartThree(question: question, answer: answer, gunningFogIndex: gfIndex)
        interactor.save(answer)
        router.openEndScreen()
    }
    
    func handle(_ error: Error) {
        view.show(title: error.localizedDescription, message: String.Error.tryAgain)
    }

}

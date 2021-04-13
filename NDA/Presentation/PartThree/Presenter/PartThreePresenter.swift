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
    var gfIndex: Double = 0
    var score: Double = 0

    func viewIsReady() {

    }
    
    func calculateScore(with gfIndex: Double) {
        self.gfIndex = gfIndex
        if gfIndex > 25 {
            score = 100.0
        } else {
            score = logForScoreCalculating(value: gfIndex, for: 25) * 100
        }
        finishQuestionnaire()
    }
    
    func logForScoreCalculating(value: Double, for base: Double) -> Double {
        return log(value)/log(base)
    }
    
    func validate(_ text: String) {
        guard !text.isEmpty else {
            view.show(message: String.Error.emptyField)
            return
        }
        guard text.count >= 20 else {
            view.show(message: String.Error.shortText)
            return
        }
    }
    
    func finishQuestionnaire() {
        let answer = AnswerPartThree(question: "", gunningFogIndex: gfIndex)
        let date = Date()
        interactor.save(answer: answer, score: score, completionDate: date)
    }

    func recive(_ text: String) {
        interactor.didRecived(text)
    }
    
    func handle(_ error: Error) {
        
    }

}

//
//  PartThreePartThreeInteractor.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import PromiseKit

class PartThreeInteractor: PartThreeInteractorInput {
    weak var output: PartThreeInteractorOutput!
    var questionServise: QuestionService!
    
    func didRecived(_ text: String) {
        firstly {
            questionServise.getGunningFogIndex(with: text)
        } .done { [weak self] (index) in
            self?.output.calculateScore(with: index)
        } .catch { [weak self] (error) in
            self?.output.handle(error)
        }
    }
    
    func save(answer: AnswerPartThree, score: Double, completionDate: Date) {
        questionServise.answerPartThree = answer
        questionServise.scorePartThree = score
        questionServise.completionDate = completionDate
    }
}

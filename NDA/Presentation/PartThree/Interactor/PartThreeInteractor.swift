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
    var question: QuestionPartThree {
        let questions = questionServise.getQuestionsPartThree()
        return questions[Int.random(in: 0..<questions.count)]
    }
    
    func didRecived(_ text: String) {
        firstly {
            questionServise.getGunningFogIndex(with: text)
        } .done { [weak self] (index) in
            self?.output.finishQuestionnaire(with: index)
        } .catch { [weak self] (error) in
            self?.output.handle(error)
        }
    }
    
    func save(_ answer: AnswerPartThree) {
        questionServise.save(answer)
        do {
            try questionServise.saveSession()
        } catch {
            output.handle(error)
        }
    }
}

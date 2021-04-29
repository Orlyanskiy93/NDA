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
    var dataService: QuestionnaireDataService!
    var timerService: TimerService!
    
    var question: QuestionPartThree {
        let questions = questionServise.getQuestionsPartThree()
        return questions[Int.random(in: 0..<questions.count)]
    }
    
    func loadGunningFogIndex(_ text: String) {
        firstly {
            questionServise.getGunningFogIndex(with: text)
        } .done { [weak self] (index) in
            self?.output.gfIndex = index
            self?.output.save(text)
        } .catch { [weak self] (error) in
            self?.output.handle(error)
        }
    }
    
    func save(_ answer: AnswerPartThree) {
        do {
            try dataService.save(answer)
        } catch {
            output.handle(error)
        }
        timerService.lounchTimer()
    }
}

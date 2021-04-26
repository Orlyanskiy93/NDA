//
//  QuestionnaireEndScreenQuestionnaireEndScreenInteractor.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class QuestionnaireEndScreenInteractor: QuestionnaireEndScreenInteractorInput {
    var questionService: QuestionService!
    weak var output: QuestionnaireEndScreenInteractorOutput!
    
    func loadScore() -> Score {
        //TODO:
        var score: Score!
        do {
            score = questionService.currentSession?.score
        } catch {
            output.handle(error)
        }
        return score
    }
}

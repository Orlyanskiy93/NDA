//
//  PartTwoPartTwoInteractor.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class PartTwoInteractor: PartTwoInteractorInput {
    weak var output: PartTwoInteractorOutput!
    var questionBank: QuestionBank!
    
    var questions: [QuestionPartTwo] {
        return questionBank.getShortAnswerQuestions()
    }
}

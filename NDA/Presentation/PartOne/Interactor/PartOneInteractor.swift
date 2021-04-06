//
//  PartOnePartOneInteractor.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class PartOneInteractor: PartOneInteractorInput {
    weak var output: PartOneInteractorOutput!
    var questionBank: QuestionService!
    
    var questions: [QuestionPartOne] {
        return questionBank.questionsPartOne
    }
}

//
//  PartTwoPartTwoInteractor.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class PartTwoInteractor: PartTwoInteractorInput {
    weak var output: PartTwoInteractorOutput!
    var questionBank: QuestionService!
    
    var questions: [QuestionPartTwo] {
        var questions = [QuestionPartTwo]()
        do {
            try questions = questionBank.getQuestioinsPartTwo(count: 8)
        } catch {
            output.handle(error)
        }
        return questions
    }
}

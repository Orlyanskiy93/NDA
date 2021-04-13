//
//  PartTwoPartTwoInteractor.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class PartTwoInteractor: PartTwoInteractorInput {
    weak var output: PartTwoInteractorOutput!
    var questionService: QuestionService!
    
    var questions: [QuestionPartTwo] {
        var questions = [QuestionPartTwo]()
        do {
            try questions = questionService.getQuestioinsPartTwo(count: 8)
        } catch {
            output.handle(error)
        }
        return questions
    }
    
    func save(answer: AnswerPartTwo, score: Double) {
        questionService.answersPartTwo.append(answer)
        questionService.scorePartTwo += score
    }
}

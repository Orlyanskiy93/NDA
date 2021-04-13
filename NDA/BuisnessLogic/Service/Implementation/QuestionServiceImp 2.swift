//
//  QuestionBankImp.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.03.2021.
//

import Foundation

class QuestionServiceImp: QuestionService {
    static var shared = QuestionServiceImp()
    
    private init() {}
                
    func getQuestionsPartOne() -> [QuestionPartOne] {
        let questions = QuestionBank.shared.questionsPartOne
        return questions
    }
    
    func getQuestioinsPartTwo(count: Int) -> [QuestionPartTwo] {
        var arithmeticQuestions = [QuestionPartTwo]()
        var identifyQuestions = [QuestionPartTwo]()
        for _ in 0..<count / 2 {
            let arithmeticQuestion = QuestionPartTwo(type: .text)
            arithmeticQuestions.append(arithmeticQuestion)
            let identifyQuestion = QuestionPartTwo(type: .image)
            identifyQuestions.append(identifyQuestion)
        }
        
        let questionsPartTwo = arithmeticQuestions + identifyQuestions
        return questionsPartTwo.shuffled()
    }
}

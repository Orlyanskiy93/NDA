//
//  QuestionBankImp.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.03.2021.
//

import Foundation

class QuestionBankImp: QuestionBank {
    static var shared = QuestionBankImp()
    var selfEfficacyQuestions = [Question]()
    
    private init() {
        prepareSelfEfficacyQuestions()
    }
    
    func getSelfEfficacyQuestions() -> [Question] {
        return selfEfficacyQuestions
    }
    
    func prepareSelfEfficacyQuestions() {
        let questions = [
            Question(title: "I am sure that I can recognize when I forget something"),
            Question(title: "I am sure that I can recognize when I become distracted"),
            Question(title: "I am sure that I can recognize when I am having difficulty concentrating"),
            Question(title: "I am sure that I can recognize when I make a mistake"),
            Question(title: "I am sure that I can recognize when I have missed details or information"),
            Question(title: "I am sure that I can recognize when my mind feels cloudy or less sharp"),
            Question(title: "I am sure that I can recognize when there is too much information for mee to process"),
            Question(title: "I am sure that I can recognize when I have lost track of what I was just doing")
        ]
        selfEfficacyQuestions.append(contentsOf: questions)
    }
}

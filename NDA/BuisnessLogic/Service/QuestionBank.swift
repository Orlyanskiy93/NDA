//
//  QuestionBank.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.03.2021.
//

import Foundation

protocol QuestionBank {
    func getSelfEfficacyQuestions() -> [QuestionPartOne]
    func getShortAnswerQuestions() -> [Question]
}

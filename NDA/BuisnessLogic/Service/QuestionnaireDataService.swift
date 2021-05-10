//
//  QuestionnaireDataService.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.04.2021.
//

import Foundation

protocol QuestionnaireDataService {
    func save(_ answersPartOne: [AnswerPartOne]) throws
    func save(_ answersPartTwo: [AnswerPartTwo]) throws
    func save(_ answerPartThree: AnswerPartThree) throws
    func getSessions() throws -> [Session]
    func getCurrentSession() throws -> Session
    func endSession()
    func clearHistory() throws
}

//
//  QuestionnaireDataService.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.04.2021.
//

import Foundation

protocol QuestionnaireDataService {
    var sessions: [Session] { get }
    var currentSession: Session! { get }
//    func save(_ session: Session) throws
    func save(_ answersPartOne: [AnswerPartOne]) throws
    func save(_ answersPartTwo: [AnswerPartTwo]) throws
    func save(_ answerPartThree: AnswerPartThree) throws
}

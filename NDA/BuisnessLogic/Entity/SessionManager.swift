//
//  SessionManager.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 15.04.2021.
//

import Foundation

protocol SessionManager {
    var sessions: [Session] { get }
    var currentSession: Session? { get }
    
    func beginSession()
    func save(_ partOne: AnswerPartOne)
    func save(_ partTwo: AnswerPartTwo)
    func save(_ partThree: AnswerPartThree)
    func saveSession() throws
}

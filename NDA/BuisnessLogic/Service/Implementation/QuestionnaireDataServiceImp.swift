//
//  QuestionnaireDataServiceImp.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.04.2021.
//

import UIKit
import CoreData

class QuestionnaireDataServiceImp {
    static let shared = QuestionnaireDataServiceImp()
    
    var state: QuestionServiceImp.State = .enable
    private weak var appDelegate: AppDelegate!
    private var context: NSManagedObjectContext!

    private var sessionsData: [SessionData] = [] 
    private var currentSessionData: SessionData!

    private init() {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        do {
            sessionsData = try fetchSessions()
            currentSessionData = try loadSessionData()
        } catch {
            state = .error
        }
    }
    
    private func fetchSessions() throws -> [SessionData] {
        guard let sessionsData = try? context.fetch(SessionData.fetchRequest()) as? [SessionData] else {
            throw DataError.fetch
        }
        return sessionsData
    }
    
    func loadSessionData() throws -> SessionData {
        guard let index = sessionsData.firstIndex(where: { (sessionData) -> Bool in
            // swiftlint:disable all
            return sessionData.answersPartTwoData?.count == 0 || sessionData.answerPartThreeData == nil
            // swiftlint:enable all
        }) else {
            return SessionData(context: context)
        }
        let sessionData = sessionsData[index]
        do {
            try context.save()
        } catch {
            throw error
        }
        return sessionData
    }
    
    func save(_ data: SessionData) {
        guard let index = sessionsData.firstIndex(of: currentSessionData) else {
            sessionsData.append(data)
            return
        }
        sessionsData[index] = data
    }
    
    func clearHistory() throws {
        sessionsData.forEach { (sessionData) in
            context.delete(sessionData)
        }
        sessionsData.removeAll()
        do {
            try context.save()
            
        } catch {
            throw error
        }
    }

    func map(_ answersPartOne: [AnswerPartOne]) -> [AnswerPartOneData] {
        var answersData = [AnswerPartOneData]()
       
        answersPartOne.forEach { (answer) in
            let answerData = AnswerPartOneData(context: context)
            answerData.question = answer.question
            answerData.value = Int32(answer.value)
            answersData.append(answerData)
        }
        return answersData
    }
    
    func map(_ answersPartTwo: [AnswerPartTwo]) -> [AnswerPartTwoData] {
        var answersData = [AnswerPartTwoData]()
        answersPartTwo.forEach { (answer) in
            let answerData = AnswerPartTwoData(context: context)
            let optionData = OptionData(context: context)
            
            let option = answer.option
            optionData.isRight = option.isRight
            optionData.type = option.type.rawValue
            optionData.value = option.value
            
            answerData.optionData = optionData
            answerData.question = answer.question
            answerData.time = Date(timeIntervalSince1970: answer.time)
            
            answersData.append(answerData)
        }
        return answersData
    }
    
    func map(_ answerPartThree: AnswerPartThree) -> AnswerPartThreeData {
        let answerData = AnswerPartThreeData(context: context)
        answerData.question = answerPartThree.question
        answerData.answer = answerPartThree.answer
        answerData.gunningFogIndex = answerPartThree.gunningFogIndex
        return answerData
    }
}

extension QuestionServiceImp {
    enum State {
        case enable
        case error
    }
}

extension QuestionnaireDataServiceImp: QuestionnaireDataService {
    func getSessions() throws -> [Session] {
        var sessions = [Session]()
        do {
            try sessionsData.forEach { (sessionData) in
                let session = try Session(with: sessionData)
                if session.stage == .finished {
                    sessions.append(session)
                }
            }
            return sessions
        } catch {
            throw error
        }
    }
    
    func getCurrentSession() throws -> Session {
        do {
            let session = try Session(with: currentSessionData)
            return session
        } catch {
            throw error
        }
    }
    
    func endSession() {
        currentSessionData = SessionData(context: context)
    }
    
    func save(_ answersPartOne: [AnswerPartOne]) throws {
        let partOneAnswersData = map(answersPartOne)
        currentSessionData.addToAnswersPartOneData(NSSet(array: partOneAnswersData))
        currentSessionData.completionDate = Date()
        save(currentSessionData)
        do {
            try context.save()
        } catch {
            throw error
        }
    }
    
    func save(_ answersPartTwo: [AnswerPartTwo]) throws {
        let partTwoAnswersData = map(answersPartTwo)
        currentSessionData.addToAnswersPartTwoData(NSSet(array: partTwoAnswersData))
        currentSessionData.completionDate = Date()
        do {
            try context.save()
        } catch {
            throw error
        }
    }
    
    func save(_ answerPartThree: AnswerPartThree) throws {
        let partThreeAnswerData = map(answerPartThree)
        currentSessionData.answerPartThreeData = partThreeAnswerData
        currentSessionData.completionDate = Date()
        do {
            try context.save()
        } catch {
            throw error
        }
    }
}

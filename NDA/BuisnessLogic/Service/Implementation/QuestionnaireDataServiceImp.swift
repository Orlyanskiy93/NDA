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
    
    private weak var appDelegate: AppDelegate!
    private var context: NSManagedObjectContext!

    private var sessionsData: [SessionData] = []
    private var currentSessionData: SessionData!

    private init() {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate.persistentContainer.viewContext
        do {
            sessionsData = try fetchSessions()
            guard !sessionsData.isEmpty else {
                currentSessionData = SessionData(context: context)
                return
            }
        } catch {
            //TODO:
        }
        
    }
    
    private func fetchSessions() throws -> [SessionData] {
        guard let sessionsData = try? context.fetch(SessionData.fetchRequest()) as? [SessionData] else {
            throw DataError.fetch
        }
        
        return sessionsData
    }
    
    func beginSession() throws {
        guard let index = sessionsData.firstIndex(where: { (sessionData) -> Bool in
//            let array = sessionData.answersPartTwoData?.allObjects as? [AnswerPartTwoData]
            //TODO:
            // swiftlint:disable all
            return sessionData.answersPartTwoData?.count == 0 || sessionData.answerPartThreeData == nil
            // swiftlint:enable all
        }) else {
            currentSessionData = SessionData(context: context)
            return
        }
        currentSessionData = sessionsData[index]
        sessionsData.remove(at: index)
        do {
            try context.save()
            
        } catch {
            throw error
        }
    }
    
    func save(_ data: SessionData) {
        guard let index = sessionsData.firstIndex(of: currentSessionData) else {
            sessionsData.append(data)
            return
        }
        sessionsData[index] = data
        
    }
    
    func clearAll() throws {
        for i in 0..<sessionsData.count {
            context.delete(sessionsData[i])
        }
        do {
            try context.save()
        } catch {
            throw DataError.save
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
    
    func map(_ sessionData: SessionData) throws -> Session {
        var session = Session()
        
        guard let answersPartOneData = sessionData.answersPartOneData?.allObjects as? [AnswerPartOneData],
              !answersPartOneData.isEmpty else {
            return session
        }
        
        var answersPartOne = [AnswerPartOne]()
        answersPartOneData.forEach({ (answerData) in
            let question = answerData.question
            let value = Int(answerData.value)
            let answer = AnswerPartOne(question: question, value: value)
            answersPartOne.append(answer)
        })
        session.save(answersPartOne)
        
        guard let answersPartTwoData = sessionData.answersPartTwoData?.allObjects as? [AnswerPartTwoData] else {
            return session
        }
        
        var answersPartTwo = [AnswerPartTwo]()
        do {
            try answersPartTwoData.forEach({ (answerData) in
                guard let optionData = answerData.optionData,
                      let optionType = OptionType(rawValue: optionData.type) else {
                    throw DataError.maping
                }
                let option = Option(value: optionData.value, type: optionType, isRight: optionData.isRight)
                let question = answerData.question
                let time = Date().timeIntervalSince(answerData.time)
                let answer = AnswerPartTwo(question: question, option: option, time: time)
                answersPartTwo.append(answer)
            })
        } catch {
            throw error
        }
        session.save(answersPartTwo)

        guard let answerPartThreeData = sessionData.answerPartThreeData else {
            return session
        }
        let answerPartThree = AnswerPartThree(question: answerPartThreeData.question,
                                              answer: answerPartThreeData.answer,
                                              gunningFogIndex: answerPartThreeData.gunningFogIndex)
        session.save(answerPartThree)
        return session
    }
}

extension QuestionnaireDataServiceImp: QuestionnaireDataService {
    func getSessions() throws -> [Session] {
        var sessions = [Session]()
        do {
            try sessionsData.forEach { (sessionData) in
                let session = try map(sessionData)
                sessions.append(session)
            }
            return sessions
        } catch {
            throw error
        }
    }
    
    func getLastSession() throws -> Session {
        do {
            let session = try map(currentSessionData)
            return session
        } catch {
            throw error
        }
    }
    
    func save(_ answersPartOne: [AnswerPartOne]) throws {
        let partOneAnswersData = map(answersPartOne)
        currentSessionData.addToAnswersPartOneData(NSSet(array: partOneAnswersData))
        currentSessionData.completionDate = Date()
        save(currentSessionData)
        
        do {
            try context.save()
        } catch {
            throw DataError.save
        }
    }
    
    func save(_ answersPartTwo: [AnswerPartTwo]) throws {
        let partTwoAnswersData = map(answersPartTwo)
        currentSessionData.addToAnswersPartTwoData(NSSet(array: partTwoAnswersData))
        currentSessionData.completionDate = Date()
        save(currentSessionData)
        
        do {
            try context.save()
        } catch {
            throw DataError.save
        }
    }
    
    func save(_ answerPartThree: AnswerPartThree) throws {
        let partThreeAnswerData = map(answerPartThree)
        currentSessionData.answerPartThreeData = partThreeAnswerData
        currentSessionData.completionDate = Date()
        save(currentSessionData)
        do {
            try context.save()
        } catch {
            throw DataError.save
        }
    }
}

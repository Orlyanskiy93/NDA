//
//  Session.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 14.04.2021.
//

import Foundation
 
struct Session {
     var stage: Stage {
        if answersPartOne.isEmpty {
            return .partOne
        }
        if answersPartTwo.isEmpty {
            return .partTwo
        }
        if answerPartThree.gunningFogIndex > 0 {
            return.finished
        } else {
            return .partThree
        }
    }
    
    private(set) var answersPartOne: [AnswerPartOne]
    private(set) var answersPartTwo: [AnswerPartTwo]
    private(set) var answerPartThree: AnswerPartThree
    private(set) var completionDate: Date
    var score: Score {
        var partOneScore = 0.0
        var partTwoScore = 0.0
        var partThreeScore = 0.0
        if !answersPartOne.isEmpty {
            partOneScore = partOneScoreCalculate()
        }
        if !answersPartTwo.isEmpty {
            partTwoScore = partTwoScoreCalculate()
        }
        if answerPartThree.gunningFogIndex != 0 {
            partThreeScore = partThreeScoreCalculate()
        }
        return Score(partOne: partOneScore, partTwo: partTwoScore, partThree: partThreeScore)
    }
    var stringsForCSV: [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dateString = dateFormatter.string(from: completionDate)
        var countOfCorrectAnswers = 0
        var totalTime = 0.0
        answersPartTwo.forEach { answer in
            if answer.option.isRight {
                countOfCorrectAnswers += 1
            }
            totalTime += answer.time
        }
        
        let averagePercentOfCorrectAnswers: Double = (Double(countOfCorrectAnswers) / Double(answersPartTwo.count)) * 100
        let averageResponsseTime = totalTime / Double(answersPartTwo.count)
                
        var array = [
            dateString,
            Int(score.average).description,
            Int(score.partOne).description,
            Int(score.partTwo).description,
            Int(score.partThree).description]
        
        array.append(contentsOf: answersPartOne.map { $0.value.description })
        
        array.append(contentsOf: [
            averagePercentOfCorrectAnswers.description,
            averageResponsseTime.rounded(digits: 2).description,
            answerPartThree.question,
            answerPartThree.answer,
            answerPartThree.gunningFogIndex.description
        ])
        return array
    }
    
    init() {
        answersPartOne = []
        answersPartTwo = []
        answerPartThree = AnswerPartThree(question: "", answer: "", gunningFogIndex: 0.0)
        completionDate = Date()
    }
    
    init(with sessionData: SessionData) throws {
        self.init()
        
        guard let answersPartOneData = sessionData.answersPartOneData?.allObjects as? [AnswerPartOneData],
              let completionDate = sessionData.completionDate else {
            return
        }
        self.answersPartOne = map(answersPartOneData)
        self.completionDate = completionDate
        
        if let answersPartTwoData = sessionData.answersPartTwoData?.allObjects as? [AnswerPartTwoData] {
            self.answersPartTwo = map(answersPartTwoData)
        }
        
        if let answerPartThreeData = sessionData.answerPartThreeData {
            self.answerPartThree = map(answerPartThreeData)
        }
    }
    
    private func partOneScoreCalculate() -> Double {
        var partOnePoints = 0
        answersPartOne.forEach { (answer) in
            partOnePoints += answer.value
        }
        return Double((partOnePoints * 100) / (answersPartOne.count * 10))
    }
    
    private func partTwoScoreCalculate() -> Double {
        var partTwoPoints = 0.0
        answersPartTwo.forEach { (answer) in
            let bestTime = 0.75
            let worstTime = 4.0
            let userTime = answer.time
            if answer.option.isRight && userTime < worstTime {
                let points = ((userTime - worstTime) * 10) / (bestTime - worstTime)
                partTwoPoints += points
            }
            if answer.option.isRight && userTime >= worstTime {
                partTwoPoints += 1
            }
            if answer.option.isRight && userTime <= bestTime {
                partTwoPoints += 10
            }
        }
        
        return (partTwoPoints * 100) / Double(answersPartTwo.count * 10)
    }
    
    private func partThreeScoreCalculate() -> Double {
        let gfIndex = answerPartThree.gunningFogIndex
        return calculatingDependency(from: gfIndex)
    }
    
    private func calculatingDependency(from gfIndex: Double) -> Double {
        var xValue = gfIndex
        if xValue < 4 {
            xValue = 4
        }
        let yFromX = (1.01 + (1 / -(xValue - 3))) * 100
        
        return yFromX
    }
    
    func map(_ answersPartOneData: [AnswerPartOneData]) -> [AnswerPartOne] {
        let answers = answersPartOneData.map { (answerData) -> AnswerPartOne in
            let question = answerData.question
            let value = answerData.value
            let answer = AnswerPartOne(question: question, value: Int(value))
            return answer
        }
        return answers
    }
        
    func map(_ answersPartTwoData: [AnswerPartTwoData]) -> [AnswerPartTwo] {
        let answers = answersPartTwoData.compactMap { (answerData) -> AnswerPartTwo? in
            guard let optionData = answerData.optionData,
                  let optionType = OptionType(rawValue: optionData.type) else {
                return nil
            }
            let time = answerData.time.timeIntervalSince1970
            let option = Option(value: optionData.value, type: optionType, isRight: optionData.isRight)
            let answer = AnswerPartTwo(question: answerData.question, option: option, time: time)
            return answer
        }
        
        return answers
    }
    
    func map(_ answerPartThreeData: AnswerPartThreeData) -> AnswerPartThree {
        let question = answerPartThreeData.question
        let answer = answerPartThreeData.answer
        let gfIndex = answerPartThreeData.gunningFogIndex
        let answerPartThree = AnswerPartThree(question: question, answer: answer, gunningFogIndex: gfIndex)
        
        return answerPartThree
    }
}

extension Session {
    enum Stage {
        case partOne
        case partTwo
        case partThree
        case finished
    }
}

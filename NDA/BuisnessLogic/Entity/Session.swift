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
    
    private(set) var answersPartOne: [AnswerPartOne] = []
    private(set) var answersPartTwo: [AnswerPartTwo] = []
    private(set) var answerPartThree: AnswerPartThree = AnswerPartThree(question: "", answer: "", gunningFogIndex: 0.0)
    private(set) var completionDate: Date = Date()
    private(set) var score: Score = Score(partOne: 0.0, partTwo: 0.0, partThree: 0.0)
    
    mutating func save(_ answersPartOne: [AnswerPartOne]) {
        self.answersPartOne = answersPartOne
        partOneScoreCalculate()
    }
    
    mutating func save(_ answersPartTwo: [AnswerPartTwo]) {
        self.answersPartTwo = answersPartTwo
        partTwoScoreCalculate()
    }
    
    mutating func save(_ answerPartThree: AnswerPartThree) {
        self.answerPartThree = answerPartThree
        partThreeScoreCalculate()
    }
    
    mutating private func partOneScoreCalculate() {
        var partOnePoints = 0
        answersPartOne.forEach { (answer) in
            partOnePoints += answer.value
        }
        score.partOne = Double((partOnePoints * 100) / (answersPartOne.count * 10))
    }
    
    mutating private func partTwoScoreCalculate() {
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
        score.partTwo = (partTwoPoints * 100) / Double(answersPartTwo.count * 10)
    }
    
    mutating private func partThreeScoreCalculate() {
        let gfIndex = answerPartThree.gunningFogIndex
        score.partThree = calculatingY(from: gfIndex)
    }
    
    private func calculatingY(from xValue: Double) -> Double {
        let yFromX = (1.01 + (1 / (-xValue + 3))) * 100
        return yFromX
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

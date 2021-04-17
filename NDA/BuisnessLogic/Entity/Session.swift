//
//  Session.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 14.04.2021.
//

import Foundation

struct Session {
    var stage: Stage = .partOne
    var answersPartOne: [AnswerPartOne] = []
    var answersPartTwo: [AnswerPartTwo] = []
    var answerPartThree: AnswerPartThree?
    var completionDate: Date = Date()
    
    func getScore() throws -> Score {
        do {
            guard stage == .finished else {
                throw SessionError.completion
            }
            let partOneScore = partOneScoreCalculate()
            let partTwoScore = partTwoScoreCalculate()
            let partThreeScore = try partThreeScoreCalculate()
            let score = Score(partOne: partOneScore, partTwo: partTwoScore, partThree: partThreeScore)
            return score
        } catch {
            throw error
        }
    }
    
    //TODO:
    private func partOneScoreCalculate() -> Double {
        var partOnePoints = 0
        answersPartOne.forEach { (answer) in
            partOnePoints += answer.value
        }
        return  Double((partOnePoints * 100) / (answersPartOne.count * 10))
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
    
    private func partThreeScoreCalculate() throws -> Double {
        guard let gfIndex = answerPartThree?.gunningFogIndex else {
            throw SessionError.gfIndex
        }
        return calculatingY(from: gfIndex)
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

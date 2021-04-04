//
//  QuestionBankImp.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.03.2021.
//

import Foundation

class QuestionBankImp: QuestionBank {
    static var shared = QuestionBankImp()
    private var selfEfficacyQuestions = [QuestionPartOne]()
    private var arithmeticQuestions = [QuestionPartTwo]()
    private var identifyQuestions = [QuestionPartTwo]()
    
    private init() {
        prepareQuestions()
    }
    
    func getSelfEfficacyQuestions() -> [QuestionPartOne] {
        return selfEfficacyQuestions
    }
    
    func getShortAnswerQuestions() -> [QuestionPartTwo] {
        let questions = arithmeticQuestions + identifyQuestions
        return questions.shuffled()
    }
    
    private func prepareQuestions() {
        prepareSelfEfficacyQuestions()
        prepareArithmeticQuestions(count: 4)
        prepareIdentifyQuestions(count: 4)
    }
    
    private func prepareSelfEfficacyQuestions() {
        let questions: [QuestionPartOne]  = [
            "I am sure that I can recognize when I forget something",
            "I am sure that I can recognize when I become distracted",
            "I am sure that I can recognize when I am having difficulty concentrating",
            "I am sure that I can recognize when I make a mistake",
            "I am sure that I can recognize when I have missed details or information",
            "I am sure that I can recognize when my mind feels cloudy or less sharp",
            "I am sure that I can recognize when there is too much information for mee to process",
            "I am sure that I can recognize when I have lost track of what I was just doing"
        ]
        selfEfficacyQuestions.append(contentsOf: questions)
    }
    
    private func prepareArithmeticQuestions(count: Int) {
        var questions = [QuestionPartTwo]()
        for number in 0..<count {
            let firstNumber = Int.random(in: 1...99)
            let secondNumber = Int.random(in: 1...firstNumber)
            var rightAnswer = 0
            var title = ""
            let range = (rightAnswer - 5)...(rightAnswer + 5)
            if number % 2 == 0 {
                title = "What is \(firstNumber) + \(secondNumber)?"
                rightAnswer = firstNumber + secondNumber
            } else {
                title = "What is \(firstNumber) - \(secondNumber)?"
                rightAnswer = firstNumber - secondNumber
            }
            let options = [
                Option(value: "\(rightAnswer)", type: .text, isRight: true),
                Option(value: "\(Int.random(in: range))", type: .text),
                Option(value: "\(Int.random(in: range))", type: .text),
                Option(value: "\(Int.random(in: range))", type: .text)
            ]
            do {
                let question = try QuestionPartTwo(title: title, options: options)
                questions.append(question)
            } catch {
                print(error)
            }
        }
        arithmeticQuestions.append(contentsOf: questions)
    }
    
    private func prepareIdentifyQuestions(count: Int) {
        var allOptions = ["zebra", "cow", "rooster", "rabbit", "tiger", "koala", "turtle", "owl",
                       "buffalo", "goat", "monkey", "rhino", "bird", "sheep", "pig", "horse"]
        var chosenOptions = [String]()
        var randomIndex: Int {
            return Int.random(in: 0..<allOptions.count)
        }
        
        for _ in 0..<count {
            let index = randomIndex
            chosenOptions.append(allOptions[index])
            allOptions.remove(at: index)
        }
        
        let firstQuestionOptions = [
            Option(value: chosenOptions[0], type: .image, isRight: true),
            Option(value: allOptions[randomIndex], type: .image),
            Option(value: allOptions[randomIndex], type: .image),
            Option(value: allOptions[randomIndex], type: .image)
        ]
        let secondQuestionOptions = [
            Option(value: chosenOptions[1], type: .image, isRight: true),
            Option(value: allOptions[randomIndex], type: .image),
            Option(value: allOptions[randomIndex], type: .image),
            Option(value: allOptions[randomIndex], type: .image)
        ]
        let thirdQuestionOptions = [
            Option(value: chosenOptions[2], type: .image, isRight: true),
            Option(value: allOptions[randomIndex], type: .image),
            Option(value: allOptions[randomIndex], type: .image),
            Option(value: allOptions[randomIndex], type: .image)
        ]
        let fourthQuestionOptions = [
            Option(value: chosenOptions[3], type: .image, isRight: true),
            Option(value: allOptions[randomIndex], type: .image),
            Option(value: allOptions[randomIndex], type: .image),
            Option(value: allOptions[randomIndex], type: .image)
        ]
        
        let title = "Please identify picture of "
        do {
            let firstQuestion = try QuestionPartTwo(title: title + chosenOptions[0], options: firstQuestionOptions)
            let secondQuestion = try QuestionPartTwo(title: title + chosenOptions[1], options: secondQuestionOptions)
            let thirdQuestion = try QuestionPartTwo(title: title + chosenOptions[2], options: thirdQuestionOptions)
            let fourthQuestion = try QuestionPartTwo(title: title + chosenOptions[3], options: fourthQuestionOptions)
            let questions = [firstQuestion, secondQuestion, thirdQuestion, fourthQuestion]
            identifyQuestions.append(contentsOf: questions)
        } catch {
            print(error)
        }
    }
}

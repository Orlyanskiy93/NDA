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
    private var arithmeticQuestions = [Question]()
    private var identifyQuestions = [Question]()
    
    private init() {
        prepareQuestions()
    }
    
    func getSelfEfficacyQuestions() -> [QuestionPartOne] {
        return selfEfficacyQuestions
    }
    
    func getShortAnswerQuestions() -> [Question] {
        let questions = arithmeticQuestions + identifyQuestions
        return questions.shuffled()
    }
    
    private func prepareQuestions() {
        prepareSelfEfficacyQuestions()
        prepareArithmeticQuestions(count: 4)
        prepareIdentifyQuestions()
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
        var questions = [Question]()
        for number in 0..<count {
            if number % 2 == 0 {
                let firstNumber = Int.random(in: 1...99)
                let secondNumber = Int.random(in: 1...99)
                let title = "What is \(firstNumber) + \(secondNumber)?"
                let rightAnswer = firstNumber + secondNumber
                let range = (rightAnswer - 5)...(rightAnswer + 5)
                let answers = ["\(rightAnswer)", "\(Int.random(in: range))", "\(Int.random(in: range))", "\(Int.random(in: range))"]
                let question = Question(title: title, answers: answers.shuffled())
                questions.append(question)
            } else {
                let firstNumber = Int.random(in: 1...99)
                let secondNumber = Int.random(in: 1..<firstNumber)
                let title = "What is \(firstNumber) - \(secondNumber)?"
                let rightAnswer = firstNumber - secondNumber
                let range = (rightAnswer - 5)...(rightAnswer + 5)
                let answers = ["\(rightAnswer)", "\(Int.random(in: range))", "\(Int.random(in: range))", "\(Int.random(in: range))"]
                let question = Question(title: title, answers: answers.shuffled())
                questions.append(question)
            }
        }
        arithmeticQuestions.append(contentsOf: questions)
    }
    
    private func prepareIdentifyQuestions() {
        let images = ["bird", "zebra", "cow", "rooster", "rabbit", "sheep", "tiger",
                      "koala", "pig", "turtle", "owl", "buffalo", "goat", "monkey",
                      "rhino", "horse"]
        let questions = [
            Question(title: "Please identify the picture of a \(images[0])",
                     answers: ["\(images[0])", "\(images[1])", "\(images[2])", "\(images[3])"]),
            Question(title: "Please identify the picture of a \(images[4])",
                     answers: ["\(images[5])", "\(images[4])", "\(images[6])", "\(images[7])"]),
            Question(title: "Please identify the picture of a \(images[8])",
                     answers: ["\(images[9])", "\(images[10])", "\(images[11])", "\(images[8])"]),
            Question(title: "Please identify the picture of a \(images[12])",
                     answers: ["\(images[13])", "\(images[12])", "\(images[14])", "\(images[15])"])
        ]
        identifyQuestions.append(contentsOf: questions)
    }
}

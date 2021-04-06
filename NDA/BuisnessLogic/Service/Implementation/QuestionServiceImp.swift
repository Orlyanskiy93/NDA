//
//  QuestionBankImp.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.03.2021.
//

import Foundation

class QuestionServiceImp: QuestionService {
    static var shared = QuestionServiceImp()
    var questionsPartOne: [QuestionPartOne] {
        return getSelfEfficacyQuestions()
    }
    var questionsPartTwo: [QuestionPartTwo] {
        let arithmeticQuestions = getArithmeticQuestions(count: 4)
        let identifiQuestions = getIdentifyQuestions()
        let questions = arithmeticQuestions + identifiQuestions
        return questions.shuffled()
    }
    
    private init() {}
                
    func getSelfEfficacyQuestions() -> [QuestionPartOne] {
        let questions = String.PartOne.questions
        return questions
    }
    
    func getArithmeticQuestions(count: Int) -> [QuestionPartTwo] {
        var questions = [QuestionPartTwo]()
        for number in 0..<count {
            let firstNumber = Int.random(in: 1...99)
            let secondNumber = Int.random(in: 1...firstNumber)
            var rightAnswer = 0
            var title = ""
            if number % 2 == 0 {
                title = String.PartTwo.arythmeticQuestion + "\(firstNumber) + \(secondNumber)?"
                rightAnswer = firstNumber + secondNumber
            } else {
                title = String.PartTwo.arythmeticQuestion + "\(firstNumber) - \(secondNumber)?"
                rightAnswer = firstNumber - secondNumber
            }
            let range = (rightAnswer - 5)...(rightAnswer + 5)
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
                
            }
        }
        return questions
    }
    
    // TODO: BUG repeat images
    func getIdentifyQuestions() -> [QuestionPartTwo] {
        var images = ["cow", "koala", "buffalo", "goat", "rhino", "bird",
                      "horse", "monkey", "owl", "pig", "rabbit", "rooster",
                      "sheep", "tiger", "turtle", "zebra"]
        var chosenImages = [String]()
        
        for _ in 0..<4 {
            let index = Int.random(in: 0..<images.count)
            chosenImages.append(images[index])
            images.remove(at: index)
        }

        func getOptions(chosenImage: String, optionsCount: Int) -> [Option] {
            let randomImages = Array(images.shuffled()[0..<optionsCount])
            let rightOption = Option(value: chosenImage, type: .image)
            var options: [Option] = [rightOption]
            for i in 0..<optionsCount {
                let option = Option(value: randomImages[i], type: .image)
                options.append(option)
            }
            return options
        }
        
        var questions = [QuestionPartTwo]()
        do {
            let firstQuestion =
                try QuestionPartTwo(title: String.PartTwo.identifyQuestion + chosenImages[0],
                                    options: getOptions(chosenImage: chosenImages[0], optionsCount: 3))
            let secondQuestion =
                try QuestionPartTwo(title: String.PartTwo.identifyQuestion + chosenImages[1],
                                    options: getOptions(chosenImage: chosenImages[1], optionsCount: 3))
            let thirdQuestion =
                try QuestionPartTwo(title: String.PartTwo.identifyQuestion + chosenImages[2],
                                    options: getOptions(chosenImage: chosenImages[2], optionsCount: 3))
            let fourthQuestion =
                try QuestionPartTwo(title: String.PartTwo.identifyQuestion + chosenImages[3],
                                    options: getOptions(chosenImage: chosenImages[3], optionsCount: 3))
            questions = [firstQuestion, secondQuestion, thirdQuestion, fourthQuestion]
        } catch {
            // TODO: ??
            print(error)
        }
        return questions
    }
}

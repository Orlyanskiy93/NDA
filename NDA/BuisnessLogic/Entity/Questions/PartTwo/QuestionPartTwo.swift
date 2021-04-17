//
//  QuestionPartTwo.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 30.03.2021.
//

import Foundation

struct QuestionPartTwo {
    private let questionBank = QuestionBank.shared
    
    private(set) var title: String!
    private(set) var firstOption: Option!
    private(set) var secondOption: Option!
    private(set) var thirdOption: Option!
    private(set) var fourthOption: Option!
    
    var type: OptionType {
        return firstOption.type
    }
        
    init(type: OptionType) throws {
        if type == .text {
            initTextQuestion()
        } else {
            try initImageQuestion()
        }
    }
    
    private mutating func initImageQuestion() throws {
        let options = questionBank.getImageOptions(count: 4)
        var title = ""
        let rightOptionIndex = options.firstIndex { (option) -> Bool in
            return option.isRight == true
        }
        guard let index = rightOptionIndex else {
            throw QuestionError.rightAnswer
        }
        title = String.PartTwo.identifyQuestion + options[index].value

        self.title = title
        firstOption = options[0]
        secondOption = options[1]
        thirdOption = options[2]
        fourthOption = options[3]
    }

    private mutating func initTextQuestion() {
        let randomNumber = Int.random(in: 1...2)
        let firstNumber = Int.random(in: 1...99)
        let secondNumber = Int.random(in: 1...firstNumber)

        var rightAnswer = 0
        var title = ""

        if randomNumber % 2 == 0 {
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
        ].shuffled()

        self.title = title
        self.firstOption = options[0]
        self.secondOption = options[1]
        self.thirdOption = options[2]
        self.fourthOption = options[3]
    }

}

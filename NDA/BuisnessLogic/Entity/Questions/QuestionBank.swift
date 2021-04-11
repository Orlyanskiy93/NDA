//
//  QuestionBank.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 10.04.2021.
//

import Foundation

class QuestionBank {
    static let shared = QuestionBank()
    
    var questionsPartOne: [QuestionPartOne] = []
    var images: [String]!
    
    private init() {
        questionsPartOne = [
            "1. I am sure that I can recognize when I forget something",
            "2. I am sure that I can recognize when I become distracted",
            "3. I am sure that I can recognize when I am having difficulty concentrating",
            "4. I am sure that I can recognize when I make a mistake",
            "5. I am sure that I can recognize when I have missed details or information",
            "6. I am sure that I can recognize when my mind feels cloudy or less sharp",
            "7. I am sure that I can recognize when there is too much information for mee to process",
            "8. I am sure that I can recognize when I have lost track of what I was just doing"
        ]
        images  = ["cow", "koala", "buffalo", "goat", "rhino", "bird",
                   "horse", "monkey", "owl", "pig", "rabbit", "rooster",
                   "sheep", "tiger", "turtle", "zebra"].shuffled()
    }

    func getArithmeticOptions(count: Int) -> [String: [Option]] {
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
        
        var options = [Option]()
        for i in 0..<count {
            if i == 0 {
                let option = Option(value: "\(rightAnswer)", type: .text, isRight: true)
                options.append(option)
            } else {
                let option = Option(value: "\(Int.random(in: range))", type: .text)
                options.append(option)
            }
        }
        let value = [title: options.shuffled()]
        return value
    }
    
    func getImageOptions(count: Int) -> [Option] {
        var options = [Option]()
        for i in 0..<count {
            let image = images[i]
            images.remove(at: i)
            images.insert(image, at: images.endIndex)
            if i == 0 {
                let option = Option(value: image, type: .image, isRight: true)
                options.append(option)
            } else {
                let option = Option(value: image, type: .image)
                options.append(option)
            }
        }
        return options.shuffled()
    }
}

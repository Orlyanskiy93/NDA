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
    var images: [String] = []
    
    private init() {
        questionsPartOne = [
            String.PartOne.question1, String.PartOne.question2, String.PartOne.question3,
            String.PartOne.question4, String.PartOne.question5, String.PartOne.question6,
            String.PartOne.question7, String.PartOne.question8
        ]
        images  = ["cow", "koala", "buffalo", "goat", "rhino", "bird",
                   "horse", "monkey", "owl", "pig", "rabbit", "rooster",
                   "sheep", "tiger", "turtle", "zebra"].shuffled()
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

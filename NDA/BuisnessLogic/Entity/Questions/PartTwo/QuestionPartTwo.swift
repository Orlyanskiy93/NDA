//
//  QuestionPartTwo.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 30.03.2021.
//

import Foundation

struct QuestionPartTwo {
    private let questionBank = QuestionBank.shared
    
    var title: String
    var firstOption: Option
    var secondOption: Option
    var thirdOption: Option
    var fourthOption: Option
    
    var type: OptionType {
        return firstOption.type
    }
        
    init(type: OptionType) {
        if type == .text {
            let arithmetic = questionBank.getArithmeticOptions(count: 4)
            var title = ""
            var options = [Option]()
            for (name, answers) in arithmetic {
                title = name
                options = answers
            }
            
            self.title = title
            firstOption = options[0]
            secondOption = options[1]
            thirdOption = options[2]
            fourthOption = options[3]
        } else {
            let options = questionBank.getImageOptions(count: 4)
            var title = ""
            options.forEach { (option) in
                if option.isRight == true {
                    title = String.PartTwo.identifyQuestion + option.value
                }
            }
            self.title = title
            firstOption = options[0]
            secondOption = options[1]
            thirdOption = options[2]
            fourthOption = options[3]
        }
    }
}

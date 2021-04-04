//
//  QuestionPartTwo.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 30.03.2021.
//

import Foundation

struct QuestionPartTwo {
    var title: String
    var firstOption: Option
    var secondOption: Option
    var thirdOption: Option
    var fourthOption: Option
    
    var type: Option.OptionType {
        return firstOption.type
    }
    
    init(title: String, firstOption: Option, secondOption: Option, thirdOption: Option, fourthOption: Option) {
        self.title = title

        self.firstOption = firstOption
        self.secondOption = secondOption
        self.thirdOption = thirdOption
        self.fourthOption = fourthOption
    }
    
    init(title: String, options: [Option]) throws {
        if options.count < 4 || options.count > 4 {
            throw QuestionError.wrongAnswerCount
        }
        self.title = title
        
        let shuffledOptions = options.shuffled()
        self.firstOption = shuffledOptions[0]
        self.secondOption = shuffledOptions[1]
        self.thirdOption = shuffledOptions[2]
        self.fourthOption = shuffledOptions[3]
    }
}

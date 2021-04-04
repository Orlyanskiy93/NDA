//
//  Strings.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.03.2021.
//

import Foundation

extension String {
    struct Error {
        static let error = "Error"
        static let ok = "OK"
        static let wrongName = "Name must contains only letters"
        static let wrongAge = "Age is to much"
        static let wrongEmail = "Wrong email"
        static let emptyField = "Field is empty"
        static let saveUser = "Unable to save user"
        static let getUser = "Unable to load user"
    }
    
    struct Button {
        static let ok = "OK"
        static let `continue` = "CONTINUE"
        static let next = "NEXT"
        static let begin = "BEGIN"
        static let editInformation = "EDIT INFORMATION"
        static let eraceAppData = "ERACE APP DATA"
    }
    
    struct Home {
        static let questionnaireDescription = "Please answer the next few questions as quickly as your ability. The questionnaire will consist of 3 parts: Self - Efficacy, Short - Answer and Long - Answer questions."
        static let beginQuestionnaire = "BEGIN QUESTIONNAIRE"
    }
    
    struct PartOne {
        static let title = "Part 1: Self Efficacy"
        static let moduleDescription = "The following questions are designed to help us get a better understanding of any symptoms you might be experiencing in the areas of attention, memory, organization and thinking. Please try to objective in your answers."
        static let instructions = "Using the scale provided, please rate how certain you are can do the following actions:"
        static let cannotCertain = "Cannot do at all"
        static let moderatelyCertain = "Moderately can do"
        static let highlyCertain = "Highly certain can do"
        static let questions = [
            "I am sure that I can recognize when I forget something",
            "I am sure that I can recognize when I become distracted",
            "I am sure that I can recognize when I am having difficulty concentrating",
            "I am sure that I can recognize when I make a mistake",
            "I am sure that I can recognize when I have missed details or information",
            "I am sure that I can recognize when my mind feels cloudy or less sharp",
            "I am sure that I can recognize when there is too much information for mee to process",
            "I am sure that I can recognize when I have lost track of what I was just doing"
        ]
    }
    
    struct PartTwo {
        static let title = "Part 2: Short Answer"
        static let moduleDescription = "The following questions are designed to test you using a few simple short - answer questions. Please try to answer these questions quickly and correctly."
        static let images = ["zebra", "cow", "rooster", "rabbit", "tiger", "koala", "turtle", "owl",
                             "buffalo", "goat", "monkey", "rhino", "bird", "sheep", "pig", "horse"]
        static let arythmeticQuestion = "What is "
        static let identifyQuestion = "Please identify picture of "
    }
}

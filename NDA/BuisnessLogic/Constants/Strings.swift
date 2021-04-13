//
//  Strings.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.03.2021.
//

import Foundation

extension String {
    
    static let welcomeMessage = NSLocalizedString("welcomeMessage", comment: "")
    
    struct Error {
        static let error = NSLocalizedString("error", comment: "")
        static let ok = NSLocalizedString("ok", comment: "")
        static let wrongName = NSLocalizedString("wrongName", comment: "")
        static let wrongAge = NSLocalizedString("wrongAge", comment: "")
        static let wrongEmail = NSLocalizedString("wrongEmail", comment: "")
        static let emptyField = NSLocalizedString("emptyField", comment: "")
        static let saveUser = NSLocalizedString("saveUser", comment: "")
        static let getUser = NSLocalizedString("getUser", comment: "")
        static let optionsCount = NSLocalizedString("optionsCount", comment: "")
        static let tryAgain = NSLocalizedString("tryAgain", comment: "")
        static let rightAnswer = NSLocalizedString("rightAnswer", comment: "")
        static let shortText = NSLocalizedString("shortText", comment: "")
    }
    
    struct Button {
        static let ok = NSLocalizedString("ok", comment: "")
        static let `continue` = NSLocalizedString("continue", comment: "")
        static let next = NSLocalizedString("next", comment: "")
        static let begin = NSLocalizedString("begin", comment: "")
        static let editInformation = NSLocalizedString("editInformation", comment: "")
        static let eraceAppData = NSLocalizedString("eraceAppData", comment: "")
    }
    
    struct Home {
        static let questionnaireDescription = NSLocalizedString("questionnaireDescription", comment: "")
        static let beginQuestionnaire = NSLocalizedString("beginQuestionnaire", comment: "")
    }
    
    struct PartOne {
        static let title = NSLocalizedString("partOneTitle", comment: "")
        static let moduleDescription = NSLocalizedString("partOneModuleDescription", comment: "")
        static let instructions = NSLocalizedString("instructions", comment: "")
        static let cannotCertain = NSLocalizedString("cannotCertain", comment: "")
        static let moderatelyCertain = NSLocalizedString("moderatelyCertain", comment: "")
        static let highlyCertain = NSLocalizedString("highlyCertain", comment: "")
        static let question1 = NSLocalizedString("partOneQuestion1", comment: "")
        static let question2 = NSLocalizedString("partOneQuestion2", comment: "")
        static let question3 = NSLocalizedString("partOneQuestion3", comment: "")
        static let question4 = NSLocalizedString("partOneQuestion4", comment: "")
        static let question5 = NSLocalizedString("partOneQuestion5", comment: "")
        static let question6 = NSLocalizedString("partOneQuestion6", comment: "")
        static let question7 = NSLocalizedString("partOneQuestion7", comment: "")
        static let question8 = NSLocalizedString("partOneQuestion8", comment: "")
    }
    
    struct PartTwo {
        static let title = NSLocalizedString("partTwoTitle", comment: "")
        static let moduleDescription = NSLocalizedString("partTwoModuleDescription", comment: "")
        static let arythmeticQuestion = NSLocalizedString("arythmeticQuestion", comment: "")
        static let identifyQuestion = NSLocalizedString("identifyQuestion", comment: "")
    }
}

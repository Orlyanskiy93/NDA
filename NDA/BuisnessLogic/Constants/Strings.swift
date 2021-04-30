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
        static let mapping = NSLocalizedString("mapping", comment: "")
        static let savingSession = NSLocalizedString("savingSession", comment: "")
        static let stage = NSLocalizedString("stage", comment: "")
        static let saveData = NSLocalizedString("saveData", comment: "")
        static let fetchData = NSLocalizedString("fetchData", comment: "")
        static let mapData = NSLocalizedString("mapData", comment: "")
    }
    
    struct Button {
        static let ok = NSLocalizedString("ok", comment: "")
        static let `continue` = NSLocalizedString("continue", comment: "")
        static let next = NSLocalizedString("next", comment: "")
        static let begin = NSLocalizedString("begin", comment: "")
        static let editInformation = NSLocalizedString("editInformation", comment: "")
        static let eraceAppData = NSLocalizedString("eraceAppData", comment: "")
        static let beginQuestionnaire = NSLocalizedString("beginQuestionnaire", comment: "")
        static let daysToNextSession = NSLocalizedString("daysToNextSession", comment: "")
        static let hoursToNextSession = NSLocalizedString("hoursToNextSession", comment: "")
        static let toHomePage = NSLocalizedString("toHomePage", comment: "")
    }
    
    struct Home {
        static let questionnaireDescription = NSLocalizedString("questionnaireDescription", comment: "")
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
    
    struct PartThree {
        static let partThreeQuestion1 = NSLocalizedString("partThreeQuestion1", comment: "")
        static let partThreeQuestion2 = NSLocalizedString("partThreeQuestion2", comment: "")
        static let partThreeQuestion3 = NSLocalizedString("partThreeQuestion3", comment: "")
    }
    
    struct Results {
        static let finishingMessage = NSLocalizedString("finishingMessage", comment: "")
        static let scoreMessage = NSLocalizedString("scoreMessage", comment: "")
        static let average = NSLocalizedString("average", comment: "")
        static let part1 = NSLocalizedString("part1", comment: "")
        static let part2 = NSLocalizedString("part2", comment: "")
        static let part3 = NSLocalizedString("part3", comment: "")
    }
    
    struct History {
        static let score = NSLocalizedString("score", comment: "")
        static let yourAnswer = NSLocalizedString("yourAnswer", comment: "")
        static let correct = NSLocalizedString("correct", comment: "")
        static let incorrect = NSLocalizedString("incorrect", comment: "")
        static let responceTime = NSLocalizedString("responceTime", comment: "")
        static let gfIndex = NSLocalizedString("gfIndex", comment: "")
        static let partOne = NSLocalizedString("partOne", comment: "")
        static let partThree = NSLocalizedString("partThree", comment: "")
        static let partTwo = NSLocalizedString("partTwo", comment: "")
    }
}

//
//  Strings.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.03.2021.
//

import Foundation

extension String {
        
    struct Error {
        static let error = NSLocalizedString("error", comment: "")
        static let ok = NSLocalizedString("ok", comment: "")
        static let cancel = NSLocalizedString("cancel", comment: "")
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
    
    struct Login {
        static let welcomeMessage = NSLocalizedString("welcomeMessage", comment: "")
        static let title = NSLocalizedString("loginTitle", comment: "")
        static let name = NSLocalizedString("name", comment: "")
        static let age = NSLocalizedString("age", comment: "")
        static let email = NSLocalizedString("email", comment: "")
        static let profileNavigationItemTitle = NSLocalizedString("profileNavigationItemTitle", comment: "")
        static let editProfileNavigationItemTitle = NSLocalizedString("editProfileNavigationItemTitle", comment: "")
        static let profile = NSLocalizedString("profile", comment: "")
    }
    
    struct Button {
        static let ok = NSLocalizedString("ok", comment: "")
        static let `continue` = NSLocalizedString("continue", comment: "")
        static let next = NSLocalizedString("next", comment: "")
        static let begin = NSLocalizedString("begin", comment: "")
        static let editInformation = NSLocalizedString("editInformation", comment: "")
        static let eraceAppData = NSLocalizedString("eraceAppData", comment: "")
        static let beginQuestionnaire = NSLocalizedString("beginQuestionnaire", comment: "")
        static let resumeQuestionnaire = NSLocalizedString("resumeQuestionnaire", comment: "")
        static let daysToNextSession = NSLocalizedString("daysToNextSession", comment: "")
        static let hoursToNextSession = NSLocalizedString("hoursToNextSession", comment: "")
        static let minutesToNextSession = NSLocalizedString("minutesToNextSession", comment: "")
        static let secondsToNextSession = NSLocalizedString("secondsToNextSession", comment: "")
        static let toHomePage = NSLocalizedString("toHomePage", comment: "")
        static let export = NSLocalizedString("export", comment: "")
        static let done = NSLocalizedString("done", comment: "")
    }
    
    struct Home {
        static let home = NSLocalizedString("home", comment: "")
        static let questionnaire = NSLocalizedString("questionnaire", comment: "")
        static let questionnaireDescription = NSLocalizedString("questionnaireDescription", comment: "")
        static let notDeterminedStatus = NSLocalizedString("notDeterminedStatus", comment: "")
        static let positiveDynamicsStatus = NSLocalizedString("positiveDynamicsStatus", comment: "")
        static let negativeDynamicsStatus = NSLocalizedString("negativeDynamicsStatus", comment: "")
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
        static let bird = NSLocalizedString("bird", comment: "")
        static let buffalo = NSLocalizedString("buffalo", comment: "")
        static let cow = NSLocalizedString("cow", comment: "")
        static let goat = NSLocalizedString("goat", comment: "")
        static let horse = NSLocalizedString("horse", comment: "")
        static let koala = NSLocalizedString("koala", comment: "")
        static let monkey = NSLocalizedString("monkey", comment: "")
        static let owl = NSLocalizedString("owl", comment: "")
        static let pig = NSLocalizedString("pig", comment: "")
        static let rabbit = NSLocalizedString("rabbit", comment: "")
        static let rhino = NSLocalizedString("rhino", comment: "")
        static let rooster = NSLocalizedString("rooster", comment: "")
        static let sheep = NSLocalizedString("sheep", comment: "")
        static let tiger = NSLocalizedString("tiger", comment: "")
        static let turtle = NSLocalizedString("turtle", comment: "")
        static let zebra = NSLocalizedString("zebra", comment: "")
    }
    
    struct PartThree {
        static let partThreeTitle = NSLocalizedString("partThreeTitle", comment: "")
        static let partThreeDescription = NSLocalizedString("partThreeDescription", comment: "")
        static let placeholder = NSLocalizedString("placeholder", comment: "")
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
        static let history = NSLocalizedString("history", comment: "")
        static let empty = NSLocalizedString("emptyHistory", comment: "")
        static let score = NSLocalizedString("score", comment: "")
        static let yourAnswer = NSLocalizedString("yourAnswer", comment: "")
        static let correct = NSLocalizedString("correct", comment: "")
        static let incorrect = NSLocalizedString("incorrect", comment: "")
        static let responceTime = NSLocalizedString("responceTime", comment: "")
        static let gfIndex = NSLocalizedString("gfIndex", comment: "")
        static let partOne = NSLocalizedString("partOne", comment: "")
        static let partThree = NSLocalizedString("partThree", comment: "")
        static let partTwo = NSLocalizedString("partTwo", comment: "")
        static let recentScores = NSLocalizedString("recentScores", comment: "")
        static let removeProfile = NSLocalizedString("removeProfile", comment: "")
    }
    
    struct Information {
        static let information = NSLocalizedString("information", comment: "")
        static let information1Question = NSLocalizedString("information1Question", comment: "")
        static let information2Question = NSLocalizedString("information2Question", comment: "")
        static let information3Question = NSLocalizedString("information3Question", comment: "")
        static let information4Question = NSLocalizedString("information4Question", comment: "")
        static let information1Answer = NSLocalizedString("information1Answer", comment: "")
        static let information2Answer = NSLocalizedString("information2Answer", comment: "")
        static let information3Answer = NSLocalizedString("information3Answer", comment: "")
        static let information4Answer = NSLocalizedString("information4Answer", comment: "")
    }
    
    struct Notifications {
        static let newSession = NSLocalizedString("newSession", comment: "")
    }
    
    struct Export {
        static let export = NSLocalizedString("export", comment: "")
        static let exportTitle = NSLocalizedString("exportTitle", comment: "")
        static let tableTitle1 = NSLocalizedString("tableTitle1", comment: "")
        static let tableTitle2 = NSLocalizedString("tableTitle2", comment: "")
        static let tableTitle3 = NSLocalizedString("tableTitle3", comment: "")
        static let tableTitle4 = NSLocalizedString("tableTitle4", comment: "")
        static let tableTitle5 = NSLocalizedString("tableTitle5", comment: "")
        static let tableTitle6 = NSLocalizedString("tableTitle6", comment: "")
        static let tableTitle7 = NSLocalizedString("tableTitle7", comment: "")
        static let tableTitle8 = NSLocalizedString("tableTitle8", comment: "")
        static let tableTitle9 = NSLocalizedString("tableTitle9", comment: "")
        static let tableTitle10 = NSLocalizedString("tableTitle10", comment: "")
        static let tableTitle11 = NSLocalizedString("tableTitle11", comment: "")
        static let tableTitle12 = NSLocalizedString("tableTitle12", comment: "")
        static let tableTitle13 = NSLocalizedString("tableTitle13", comment: "")
        static let tableTitle14 = NSLocalizedString("tableTitle14", comment: "")
        static let tableTitle15 = NSLocalizedString("tableTitle15", comment: "")
        static let tableTitle16 = NSLocalizedString("tableTitle16", comment: "")
        static let tableTitle17 = NSLocalizedString("tableTitle17", comment: "")
        static let tableTitle18 = NSLocalizedString("tableTitle18", comment: "")
        static var tableTitlesStrings: [String] {
            let array = [tableTitle1,
                         tableTitle2,
                         tableTitle3,
                         tableTitle4,
                         tableTitle5,
                         tableTitle6 + PartOne.question1,
                         tableTitle7 + PartOne.question2,
                         tableTitle8 + PartOne.question3,
                         tableTitle9 + PartOne.question4,
                         tableTitle10 + PartOne.question5,
                         tableTitle11 + PartOne.question6,
                         tableTitle12 + PartOne.question7,
                         tableTitle13 + PartOne.question8,
                         tableTitle14,
                         tableTitle15,
                         tableTitle16,
                         tableTitle17,
                         tableTitle18]
            return array
        }
        
    }
}

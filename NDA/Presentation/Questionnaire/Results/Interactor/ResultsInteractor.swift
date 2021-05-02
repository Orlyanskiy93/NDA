//
//  QuestionnaireEndScreenQuestionnaireEndScreenInteractor.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class ResultsInteractor: ResultsInteractorInput {
    var dataService: QuestionnaireDataService!
    weak var output: ResultsInteractorOutput!
    
    func loadSession() -> Session {
        var session = Session()
        do {
            session = try dataService.getLastSession()
        } catch {
            output.handle(error)
        }
        return session
    }
}

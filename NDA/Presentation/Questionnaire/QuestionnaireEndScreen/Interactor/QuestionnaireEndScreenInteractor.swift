//
//  QuestionnaireEndScreenQuestionnaireEndScreenInteractor.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class QuestionnaireEndScreenInteractor: QuestionnaireEndScreenInteractorInput {
    var dataService: QuestionnaireDataService!
    weak var output: QuestionnaireEndScreenInteractorOutput!
    
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

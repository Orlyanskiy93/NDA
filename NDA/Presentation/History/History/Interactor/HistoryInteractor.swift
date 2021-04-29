//
//  HistoryHistoryInteractor.swift
//  NDA
//
//  Created by Dmitriy on 17/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class HistoryInteractor: HistoryInteractorInput {
    weak var output: HistoryInteractorOutput!
    var dataService: QuestionnaireDataService!
    
    func loadSessions() -> [Session] {
        var sessions = [Session]()
        do {
            sessions = try dataService.getSessions()
        } catch {
            output.handle(error)
        }
        return sessions
    }
}

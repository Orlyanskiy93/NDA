//
//  ExportExportInteractor.swift
//  NDA
//
//  Created by Dmitriy on 07/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class ExportInteractor: ExportInteractorInput {
    var dataService: QuestionnaireDataService!
    weak var output: ExportInteractorOutput!
    
    func loadSessions() -> [Session] {
        var sessions = [Session]()
        do {
            sessions = try dataService.getSessions()
        } catch {
            
        }
        return sessions
    }
}

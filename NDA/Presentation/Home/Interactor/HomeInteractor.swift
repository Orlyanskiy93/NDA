//
//  HomeHomeInteractor.swift
//  NDA
//
//  Created by Dmitriy on 25/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class HomeInteractor: HomeInteractorInput, TimerObserver {

    weak var output: HomeInteractorOutput!
    var dataService: QuestionnaireDataService!
    var timerService: TimerService!

    func loadSession() -> Session {
        timerService.registerObserver(self)
        var session = Session()
        do {
            try dataService.beginSession()
            session = try dataService.getLastSession()
        } catch {
            output.handle(error)
        }
        return session
    }
    
    func didUpdate(_ days: Int) {
        output.didLoad(daysToNextQuestionnaire: days)
    }
}

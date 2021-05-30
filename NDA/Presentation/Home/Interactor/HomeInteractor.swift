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
    var notificationsService: NotificationsService!
    
    func loadSessions() -> [Session] {
        var sessions = [Session]()
        do {
            try sessions = dataService.getSessions()
        } catch {
            output.handle(error)
        }
        return sessions
    }
    
    func loadSession() -> Session {
        loadLastCompletedSession()
        var session = Session()
        do {
            session = try dataService.getCurrentSession()
        } catch {
            output.handle(error)
        }
        return session
    }
        
    func loadLastCompletedSession() {
        do {
            var sessions = try dataService.getSessions()
            sessions.sort { session1, session2 in
                return session1.completionDate > session2.completionDate
            }
            guard let lastCompletedSession = sessions.first else {
                return
            }
            setupTimer(with: lastCompletedSession.completionDate)
        } catch {
            output.handle(error)
        }
    }
    
    func setupTimer(with completionDate: Date) {
        timerService.registerObserver(self)
        timerService.setupTimer(with: completionDate)
    }
    
    func didUpdate(_ timeInterval: TimeInterval) {
        output.didLoad(timeIntervalToNextQuestionnaire: timeInterval)
    }
}

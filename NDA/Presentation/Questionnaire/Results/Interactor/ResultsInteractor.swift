//
//  QuestionnaireEndScreenQuestionnaireEndScreenInteractor.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation
class ResultsInteractor: ResultsInteractorInput {
    var dataService: QuestionnaireDataService!
    weak var output: ResultsInteractorOutput!
    var notificationService: NotificationsService!
    
    func loadSession() -> Session {
        var session = Session()
        do {
            session = try dataService.getCurrentSession()
        } catch {
            output.handle(error)
        }
        setupNotification()
        return session
    }
    
    func setupNotification() {
        let timeInterval = TimeInterval()
<<<<<<< HEAD
        notificationService.setNotification(with: timeInterval.day * 30)
=======
//        let timeIntervalToNextQuestionnaire = date.timeIntervalSinceNow * timeInterval.day * 30
//        notificationService.setNotification(with: timeIntervalToNextQuestionnaire)
>>>>>>> Develop
    }
    
    func finishSession() {
        dataService.endSession()
    }
}

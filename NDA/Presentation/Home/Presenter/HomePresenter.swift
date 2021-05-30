//
//  HomeHomePresenter.swift
//  NDA
//
//  Created by Dmitriy on 25/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class HomePresenter: HomeModuleInput, HomeViewOutput, HomeInteractorOutput {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    var session: Session!
    var sessions: [Session] = []
    var isActiveTimer: Bool = false
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func updateView() {
        session = interactor.loadSession()
        sessions = interactor.loadSessions()
        view.setStatus(with: sessions)
        if !isActiveTimer {
            view.updateButton(with: session)
        }
    }
        
    func didLoad(timeIntervalToNextQuestionnaire timeInterval: TimeInterval) {
        isActiveTimer = true
        view.updateButton(with: timeInterval)
    }
    
    func runSession() {
        if session.stage == .partOne {
            router.openPartOne()
        }
        if session.stage == .partTwo {
            router.openPartTwo()
        }
        if session.stage == .partThree {
            router.openPartThree()
        }
    }
    
    func handle(_ error: Error) {
        view.show(error) { [weak self] _ in
            self?.runSession()
        }
    }
}

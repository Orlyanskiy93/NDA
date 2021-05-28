//
//  HistoryHistoryPresenter.swift
//  NDA
//
//  Created by Dmitriy on 17/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class HistoryPresenter: HistoryModuleInput, HistoryViewOutput, HistoryInteractorOutput {

    weak var view: HistoryViewInput!
    var interactor: HistoryInteractorInput!
    var router: HistoryRouterInput!
    var sessions: [Session] = []

    func viewIsReady() {
        sessions = interactor.loadSessions()
        view.setupInitialState()
        guard !sessions.isEmpty else {
            view.emptySessionsViewSetup()
            return
        }
        view.update(sessions)
    }
    
    func didSelected(_ session: Session) {
        router.openSessionDescription(session)
    }
    
    func handle(_ error: Error) {
        view.show(error) { [weak self] _ in
            self?.viewIsReady()
        }
    }
}

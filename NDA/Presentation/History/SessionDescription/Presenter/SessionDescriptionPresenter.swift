//
//  SessionDescriptionSessionDescriptionPresenter.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class SessionDescriptionPresenter: NSObject, SessionDescriptionModuleInput, SessionDescriptionViewOutput, SessionDescriptionInteractorOutput {

    weak var view: SessionDescriptionViewInput!
    var interactor: SessionDescriptionInteractorInput!
    var router: SessionDescriptionRouterInput!
    var session: Session!

    func viewIsReady() {
        view.setupInitialState()
        view.fill(with: session)
    }
    
    func load(_ session: Session) {
        self.session = session
    }
    
    func openPartOneDetails() {
        router.openPartOneDetails(with: session)
    }
    
    func openPartTwoDetails() {
        router.openPartTwoDetails(with: session)
    }
    
    func openPartThreeDetails() {
        router.openPartThreeDetails(with: session)
    }
}

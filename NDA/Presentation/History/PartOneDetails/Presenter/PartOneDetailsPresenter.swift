//
//  PartOneDetailsPartOneDetailsPresenter.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class PartOneDetailsPresenter: NSObject, PartOneDetailsModuleInput, PartOneDetailsViewOutput, PartOneDetailsInteractorOutput {

    weak var view: PartOneDetailsViewInput!
    var interactor: PartOneDetailsInteractorInput!
    var router: PartOneDetailsRouterInput!
    var session: Session!

    func viewIsReady() {
        view.update(session)
    }
    
    func load(_ session: Session) {
        self.session = session
    }
}

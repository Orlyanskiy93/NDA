//
//  PartTwoDetailsPartTwoDetailsPresenter.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class PartTwoDetailsPresenter: NSObject, PartTwoDetailsModuleInput, PartTwoDetailsViewOutput, PartTwoDetailsInteractorOutput {

    weak var view: PartTwoDetailsViewInput!
    var interactor: PartTwoDetailsInteractorInput!
    var router: PartTwoDetailsRouterInput!
    var session: Session!

    func viewIsReady() {
        view.update(session)
    }
    
    func load(_ session: Session) {
        self.session = session
    }
}

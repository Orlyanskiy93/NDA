//
//  PartThreeDetailsPartThreeDetailsPresenter.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class PartThreeDetailsPresenter: NSObject, PartThreeDetailsModuleInput, PartThreeDetailsViewOutput, PartThreeDetailsInteractorOutput {

    weak var view: PartThreeDetailsViewInput!
    var interactor: PartThreeDetailsInteractorInput!
    var router: PartThreeDetailsRouterInput!
    var session: Session!

    func viewIsReady() {
        view.fill(with: session)
    }
    
    func load(_ session: Session) {
        self.session = session
    }
}

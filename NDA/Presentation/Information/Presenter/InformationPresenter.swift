//
//  InformationInformationPresenter.swift
//  NDA
//
//  Created by Dmitriy on 09/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class InformationPresenter: NSObject, InformationModuleInput, InformationViewOutput, InformationInteractorOutput {

    weak var view: InformationViewInput!
    var interactor: InformationInteractorInput!
    var router: InformationRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        let faqArray = interactor.getFAQArray()
        view.update(faqArray)
    }
}

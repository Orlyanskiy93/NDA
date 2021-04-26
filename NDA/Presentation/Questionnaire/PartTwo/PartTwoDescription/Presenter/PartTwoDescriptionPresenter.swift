//
//  PartTwoDescriptionPartTwoDescriptionPresenter.swift
//  NDA
//
//  Created by Dmitriy on 04/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class PartTwoDescriptionPresenter: PartTwoDescriptionModuleInput, PartTwoDescriptionViewOutput, PartTwoDescriptionInteractorOutput {

    weak var view: PartTwoDescriptionViewInput!
    var interactor: PartTwoDescriptionInteractorInput!
    var router: PartTwoDescriptionRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
}

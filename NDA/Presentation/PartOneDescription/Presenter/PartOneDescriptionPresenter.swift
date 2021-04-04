//
//  PartOneDescriptionPartOneDescriptionPresenter.swift
//  NDA
//
//  Created by Dmitriy on 04/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class PartOneDescriptionPresenter: PartOneDescriptionModuleInput, PartOneDescriptionViewOutput, PartOneDescriptionInteractorOutput {

    weak var view: PartOneDescriptionViewInput!
    var interactor: PartOneDescriptionInteractorInput!
    var router: PartOneDescriptionRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
}

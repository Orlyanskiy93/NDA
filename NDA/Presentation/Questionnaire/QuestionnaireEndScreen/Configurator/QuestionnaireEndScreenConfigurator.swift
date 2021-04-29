//
//  QuestionnaireEndScreenQuestionnaireEndScreenConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class QuestionnaireEndScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? QuestionnaireEndScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: QuestionnaireEndScreenViewController) {

        let router = QuestionnaireEndScreenRouter()
        router.transitionHandler = viewController

        let presenter = QuestionnaireEndScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = QuestionnaireEndScreenInteractor()
        interactor.output = presenter
        interactor.dataService = QuestionnaireDataServiceImp.shared

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}

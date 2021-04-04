//
//  QuestionnaireInformationQuestionnaireInformationConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 01/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class QuestionnaireInformationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? QuestionnaireInformationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: QuestionnaireInformationViewController) {

        let router = QuestionnaireInformationRouter()
        router.transitionHandler = viewController

        let presenter = QuestionnaireInformationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = QuestionnaireInformationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

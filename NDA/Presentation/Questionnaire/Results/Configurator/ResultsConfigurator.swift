//
//  QuestionnaireEndScreenQuestionnaireEndScreenConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class ResultsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ResultsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ResultsViewController) {

        let router = ResultsRouter()
        router.transitionHandler = viewController

        let presenter = ResultsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ResultsInteractor()
        interactor.output = presenter
        interactor.dataService = QuestionnaireDataServiceImp.shared
        interactor.notificationService = NotificationsServiceImp.shared

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}

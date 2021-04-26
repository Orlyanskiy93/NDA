//
//  HistoryHistoryConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 17/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class HistoryModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? HistoryViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: HistoryViewController) {

        let router = HistoryRouter()
        router.transitionHandler = viewController

        let presenter = HistoryPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = HistoryInteractor()
        interactor.output = presenter
        interactor.questionService = QuestionServiceImp.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

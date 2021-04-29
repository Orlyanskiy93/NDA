//
//  PartThreePartThreeConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartThreeModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PartThreeViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartThreeViewController) {

        let router = PartThreeRouter()
        router.transitionHandler = viewController

        let presenter = PartThreePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartThreeInteractor()
        interactor.output = presenter
        interactor.questionServise = QuestionServiceImp.shared
        interactor.dataService = QuestionnaireDataServiceImp.shared
        interactor.timerService = TimerServiceImp.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

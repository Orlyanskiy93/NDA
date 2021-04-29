//
//  PartOnePartOneConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PartOneViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartOneViewController) {

        let router = PartOneRouter()
        router.transitionHandler = viewController

        let presenter = PartOnePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartOneInteractor()
        interactor.output = presenter
        interactor.questionService = QuestionServiceImp.shared
        //TODO:
        interactor.dataService = QuestionnaireDataServiceImp.shared

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}

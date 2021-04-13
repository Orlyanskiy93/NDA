//
//  PartTwoPartTwoConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? PartTwoViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartTwoViewController) {

        let router = PartTwoRouter()
        router.transitionHandler = viewController

        let presenter = PartTwoPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartTwoInteractor()
        interactor.output = presenter
        interactor.questionService = QuestionServiceImp.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

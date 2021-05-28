//
//  PartTwoDetailsPartTwoDetailsConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoDetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PartTwoDetailsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartTwoDetailsViewController) {

        let router = PartTwoDetailsRouter()
        router.transitionHandler = viewController

        let presenter = PartTwoDetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartTwoDetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}

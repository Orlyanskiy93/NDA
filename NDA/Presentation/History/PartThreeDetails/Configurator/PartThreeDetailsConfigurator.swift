//
//  PartThreeDetailsPartThreeDetailsConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartThreeDetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PartThreeDetailsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartThreeDetailsViewController) {

        let router = PartThreeDetailsRouter()
        router.transitionHandler = viewController

        let presenter = PartThreeDetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartThreeDetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}

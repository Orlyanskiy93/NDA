//
//  PartOneDetailsPartOneDetailsConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneDetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PartOneDetailsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartOneDetailsViewController) {

        let router = PartOneDetailsRouter()

        let presenter = PartOneDetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartOneDetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}

//
//  InformationInformationConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 09/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class InformationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? InformationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: InformationViewController) {

        let router = InformationRouter()
        router.transitionHandler = viewController

        let presenter = InformationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = InformationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}

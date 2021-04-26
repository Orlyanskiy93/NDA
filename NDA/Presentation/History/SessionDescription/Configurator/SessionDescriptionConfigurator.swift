//
//  SessionDescriptionSessionDescriptionConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class SessionDescriptionModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SessionDescriptionViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SessionDescriptionViewController) {

        let router = SessionDescriptionRouter()
        router.transitionHandler = viewController

        let presenter = SessionDescriptionPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SessionDescriptionInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}

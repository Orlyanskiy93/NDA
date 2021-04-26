//
//  PartOneDescriptionPartOneDescriptionConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 04/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneDescriptionModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PartOneDescriptionViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartOneDescriptionViewController) {

        let router = PartOneDescriptionRouter()

        let presenter = PartOneDescriptionPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartOneDescriptionInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

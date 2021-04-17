//
//  PartTwoDescriptionPartTwoDescriptionConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 04/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoDescriptionModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PartTwoDescriptionViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartTwoDescriptionViewController) {

        let router = PartTwoDescriptionRouter()

        let presenter = PartTwoDescriptionPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartTwoDescriptionInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

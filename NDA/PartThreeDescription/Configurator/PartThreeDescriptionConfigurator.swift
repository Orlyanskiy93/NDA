//
//  PartThreeDescriptionPartThreeDescriptionConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartThreeDescriptionModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PartThreeDescriptionViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartThreeDescriptionViewController) {

        let router = PartThreeDescriptionRouter()

        let presenter = PartThreeDescriptionPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartThreeDescriptionInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

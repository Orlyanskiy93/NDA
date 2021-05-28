//
//  Part1Part1Configurator.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class Part1ModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? Part1ViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: Part1ViewController) {

        let router = Part1Router()

        let presenter = Part1Presenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = Part1Interactor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

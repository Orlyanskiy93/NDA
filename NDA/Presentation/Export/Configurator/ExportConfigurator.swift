//
//  ExportExportConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 07/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class ExportModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ExportViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ExportViewController) {

        let router = ExportRouter()
        router.transitionHandler = viewController

        let presenter = ExportPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ExportInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}

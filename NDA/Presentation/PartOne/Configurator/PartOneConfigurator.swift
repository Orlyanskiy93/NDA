//
//  PartOnePartOneConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PartOneViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartOneViewController) {

        let router = PartOneRouter()

        let presenter = PartOnePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartOneInteractor()
        interactor.output = presenter
        interactor.questionBank = QuestionBankImp.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

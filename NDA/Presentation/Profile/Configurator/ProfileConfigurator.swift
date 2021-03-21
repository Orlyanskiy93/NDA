//
//  ProfileProfileConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class ProfileModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ProfileViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ProfileViewController) {

        let router = ProfileRouter()

        let presenter = ProfilePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ProfileInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

//
//  EditProfileEditProfileConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class EditProfileModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? EditProfileViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: EditProfileViewController) {

        let router = EditProfileRouter()

        let presenter = EditProfilePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = EditProfileInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

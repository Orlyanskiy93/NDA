//
//  HomeHomeConfigurator.swift
//  NDA
//
//  Created by Dmitriy on 25/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class HomeModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? HomeViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: HomeViewController) {

        let router = HomeRouter()
        router.transitionHandler = viewController

        let presenter = HomePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = HomeInteractor()
        interactor.output = presenter
        interactor.dataService = QuestionnaireDataServiceImp.shared
        interactor.timerService = TimerServiceImp.shared
        interactor.notificationsService = NotificationsServiceImp.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

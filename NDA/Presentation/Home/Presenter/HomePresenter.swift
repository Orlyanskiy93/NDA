//
//  HomeHomePresenter.swift
//  NDA
//
//  Created by Dmitriy on 25/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class HomePresenter: HomeModuleInput, HomeViewOutput, HomeInteractorOutput {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    var session: Session!
    
    func viewIsReady() {
        self.session = interactor.loadSession()
        view.setup(with: session)
    }
        
    func didLoad(timeIntervalToNextQuestionnaire timeInterval: TimeInterval) {
        view.updateButton(with: timeInterval)
    }
    
    func runSession() {
        if session.stage == .partOne {
            router.openPartOne()
        }
        if session.stage == .partTwo {
            router.openPartTwo()
        }
        if session.stage == .partThree {
            router.openPartThree()
        }
    }
    
    func handle(_ error: Error) {
        view.show(error) { [weak self] _ in
            self?.runSession()
        }
    }
}

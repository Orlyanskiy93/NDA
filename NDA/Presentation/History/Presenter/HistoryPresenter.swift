//
//  HistoryHistoryPresenter.swift
//  NDA
//
//  Created by Dmitriy on 17/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class HistoryPresenter: HistoryModuleInput, HistoryViewOutput, HistoryInteractorOutput {

    weak var view: HistoryViewInput!
    var interactor: HistoryInteractorInput!
    var router: HistoryRouterInput!

    func viewIsReady() {

    }
}

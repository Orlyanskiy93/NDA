//
//  ExportExportPresenter.swift
//  NDA
//
//  Created by Dmitriy on 07/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class ExportPresenter: NSObject, ExportModuleInput, ExportViewOutput, ExportInteractorOutput {

    weak var view: ExportViewInput!
    var interactor: ExportInteractorInput!
    var router: ExportRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
}

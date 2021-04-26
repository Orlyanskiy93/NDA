//
//  PartThreeDescriptionPartThreeDescriptionPresenter.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

class PartThreeDescriptionPresenter: NSObject, PartThreeDescriptionModuleInput, PartThreeDescriptionViewOutput, PartThreeDescriptionInteractorOutput {

    weak var view: PartThreeDescriptionViewInput!
    var interactor: PartThreeDescriptionInteractorInput!
    var router: PartThreeDescriptionRouterInput!

    func viewIsReady() {

    }
}

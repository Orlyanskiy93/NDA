//
//  Part1Part1Presenter.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class Part1Presenter: Part1ModuleInput, Part1ViewOutput, Part1InteractorOutput {

    weak var view: Part1ViewInput!
    var interactor: Part1InteractorInput!
    var router: Part1RouterInput!

    func viewIsReady() {

    }
}

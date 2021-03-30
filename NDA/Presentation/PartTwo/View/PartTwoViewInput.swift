//
//  PartTwoPartTwoViewInput.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartTwoViewInput: class {
    func setupInitialState()
    func fillButtonsTitle(with arithmeticQuestion: Question)
    func fillButtonsBackground(with identifyQuestion: Question)
}

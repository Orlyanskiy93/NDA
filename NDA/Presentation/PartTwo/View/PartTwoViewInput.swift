//
//  PartTwoPartTwoViewInput.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartTwoViewInput: class {
    func setupInitialState()
    func setupProgressView(with questions: [QuestionPartTwo])
    func fillButtonsTitle(with arithmeticQuestion: QuestionPartTwo)
    func fillButtonsBackground(with identifyQuestion: QuestionPartTwo)
}

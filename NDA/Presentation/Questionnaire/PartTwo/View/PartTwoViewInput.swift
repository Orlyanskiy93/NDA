//
//  PartTwoPartTwoViewInput.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartTwoViewInput: AnyObject, UIViewInput {
    func setup(with questionCount: Int)
    func fillButtons(with arithmeticQuestion: QuestionPartTwo)
    func fillImageViews(with identifyQuestion: QuestionPartTwo)
    func updateProgressView(with value: Float)
}

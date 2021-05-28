//
//  PartOnePartOneViewInput.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartOneViewInput: AnyObject, UIViewInput {
    func setupInitialState(with questionsCount: Int)
    func show(_ question: QuestionPartOne)
    func showEditing(_ question: QuestionPartOne, with answerValue: Float)
    func updateProgressView(with value: Float)
}

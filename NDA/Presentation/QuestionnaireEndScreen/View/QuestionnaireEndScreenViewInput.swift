//
//  QuestionnaireEndScreenQuestionnaireEndScreenViewInput.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol QuestionnaireEndScreenViewInput: class, UIViewInput {
    func setupInitialState()
    func fill(with score: Score)
}

//
//  PartThreePartThreeViewInput.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartThreeViewInput: AnyObject, UIViewInput {
    func setupInitialState()
    func fill(with question: QuestionPartThree)
}

//
//  PartThreePartThreeInteractorInput.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

protocol PartThreeInteractorInput {
    func didRecived(_ text: String)
    func save(answer: AnswerPartThree, score: Double, completionDate: Date)
}
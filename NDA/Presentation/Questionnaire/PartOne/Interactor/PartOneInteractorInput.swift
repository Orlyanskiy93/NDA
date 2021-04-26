//
//  PartOnePartOneInteractorInput.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

protocol PartOneInteractorInput {
    var questions: [QuestionPartOne] { get }
    func save(_ answers: [AnswerPartOne])
}

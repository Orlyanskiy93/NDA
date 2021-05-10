//
//  PartOnePartOneViewOutput.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartOneViewOutput {
    var chosenQuestionNumber: Int { get }
    func viewIsReady()
    func answerDidChosen(with points: Int)
    func editQuestion(with number: Int)
}

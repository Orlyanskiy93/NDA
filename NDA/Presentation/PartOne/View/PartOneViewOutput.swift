//
//  PartOnePartOneViewOutput.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartOneViewOutput {
    var score: Int { get set }
    func viewIsReady()
    func nextQuestion()
}

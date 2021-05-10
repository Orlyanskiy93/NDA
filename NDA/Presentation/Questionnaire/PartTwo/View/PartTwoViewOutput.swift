//
//  PartTwoPartTwoViewOutput.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartTwoViewOutput {
    var chosenQuestion: Int { get }
    func viewIsReady()
    func didChosen(_ option: Option)
    func loadQuestion()
}

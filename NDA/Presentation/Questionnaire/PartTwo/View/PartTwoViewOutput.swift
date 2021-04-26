//
//  PartTwoPartTwoViewOutput.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartTwoViewOutput {
    func viewIsReady()
    func didChosen(_ option: Option)
    func loadQuestion()
}

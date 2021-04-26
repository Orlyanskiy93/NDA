//
//  PartTwoDetailsPartTwoDetailsModuleInput.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import ViperMcFlurry

protocol PartTwoDetailsModuleInput: class, RamblerViperModuleInput {
    func load(_ session: Session)
}

//
//  EditProfileEditProfileModuleInput.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import ViperMcFlurry

protocol EditProfileModuleInput: class, RamblerViperModuleInput {
    func set(_ user: User)
}

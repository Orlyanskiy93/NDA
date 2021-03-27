//
//  PartOnePartOneViewInput.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartOneViewInput: class {
    func setupInitialState()
    func show(_ question: Question)
}

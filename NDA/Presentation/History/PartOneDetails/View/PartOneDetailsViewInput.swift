//
//  PartOneDetailsPartOneDetailsViewInput.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartOneDetailsViewInput: class, UIViewInput {
    func setupInitialState()
    func update(_ session: Session)
}

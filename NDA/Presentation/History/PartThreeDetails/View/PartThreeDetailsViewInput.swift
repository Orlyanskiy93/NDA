//
//  PartThreeDetailsPartThreeDetailsViewInput.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol PartThreeDetailsViewInput: AnyObject, UIViewInput {
    func setupInitialState()
    func fill(with session: Session)
}

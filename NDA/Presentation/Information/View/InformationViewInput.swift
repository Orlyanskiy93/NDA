//
//  InformationInformationViewInput.swift
//  NDA
//
//  Created by Dmitriy on 09/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol InformationViewInput: class {
    func setupInitialState()
    func update(_ faqArray: [FAQ])
}

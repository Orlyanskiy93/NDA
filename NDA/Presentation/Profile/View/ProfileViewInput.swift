//
//  ProfileProfileViewInput.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol ProfileViewInput: AnyObject, UIViewInput {
    func setupInitialState()
    func fillLabels(with user: User)
}

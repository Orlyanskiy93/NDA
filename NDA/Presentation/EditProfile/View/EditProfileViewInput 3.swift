//
//  EditProfileEditProfileViewInput.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol EditProfileViewInput: class, UIViewInput {
    func setupInitialState()
    func fill(with user: User)
}

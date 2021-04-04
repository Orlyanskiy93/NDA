//
//  ProfileProfileInteractorInput.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

protocol ProfileInteractorInput {
    func loadUser() -> User?
    func removeUser()
}

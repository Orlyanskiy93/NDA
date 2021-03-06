//
//  HomeHomeInteractorInput.swift
//  NDA
//
//  Created by Dmitriy on 25/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

protocol HomeInteractorInput {
    func loadSession() -> Session
    func loadSessions() -> [Session]
}

//
//  HistoryHistoryViewInput.swift
//  NDA
//
//  Created by Dmitriy on 17/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

protocol HistoryViewInput: class {
    func setupInitialState()
    func emptySessionsViewSetup()
    func update(_ sessions: [Session])
}

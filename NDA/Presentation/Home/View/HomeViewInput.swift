//
//  HomeHomeViewInput.swift
//  NDA
//
//  Created by Dmitriy on 25/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

protocol HomeViewInput: AnyObject, UIViewInput {
    func setupInitialState()
    func updateButton(with session: Session)
    func updateButton(with timeInterval: TimeInterval)
    func setStatus(with sessions: [Session])
}

//
//  HomeHomeInteractorOutput.swift
//  NDA
//
//  Created by Dmitriy on 25/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

protocol HomeInteractorOutput: AnyObject {
    func handle(_ error: Error)
    func didLoad(timeIntervalToNextQuestionnaire timeInterval: TimeInterval)
}

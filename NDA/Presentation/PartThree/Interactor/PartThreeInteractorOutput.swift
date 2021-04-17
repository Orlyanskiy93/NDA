//
//  PartThreePartThreeInteractorOutput.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

protocol PartThreeInteractorOutput: class {
    func handle(_ error: Error)
    func finishQuestionnaire(with gunningFogIndex: Double)
}

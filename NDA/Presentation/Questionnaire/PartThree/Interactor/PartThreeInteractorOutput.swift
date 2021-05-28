//
//  PartThreePartThreeInteractorOutput.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

protocol PartThreeInteractorOutput: AnyObject {
    var gfIndex: Double { get set }
    func handle(_ error: Error)
    func save(_ answer: String)
}

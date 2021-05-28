//
//  SessionDescriptionSessionDescriptionRouterInput.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

protocol SessionDescriptionRouterInput {
    func openPartOneDetails(with session: Session)
    func openPartTwoDetails(with session: Session)
    func openPartThreeDetails(with session: Session)
}

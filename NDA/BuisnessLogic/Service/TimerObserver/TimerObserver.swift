//
//  TimerObserver.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.04.2021.
//

import Foundation

protocol TimerObserver: AnyObject {
    func didUpdate(_ timeInterval: TimeInterval)
}

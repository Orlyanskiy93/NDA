//
//  TimerObserver.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.04.2021.
//

import Foundation

protocol TimerSubject {
    func registerObserver(_ observer: TimerObserver)
    func removeObserver(_ observer: TimerObserver)
    func notifyObservers()
}

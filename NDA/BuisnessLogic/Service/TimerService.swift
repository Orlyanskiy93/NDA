//
//  TimerService.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 28.04.2021.
//

import Foundation

protocol TimerService: TimerSubject {
    var fireDate: Date { get }
    func setupTimer(with completionDate: Date?)
    func stopTimer()
}

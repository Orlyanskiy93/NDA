//
//  Timer.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.04.2021.
//

import Foundation

class TimerServiceImp: TimerSubject, TimerService {
    static let shared = TimerServiceImp()
    
    var timer: Timer!
    var observers: [TimerObserver] = []
    var minuteInterval: TimeInterval!
    var hourInterval: TimeInterval!
    var dayInterval: TimeInterval!
    var dateToNextQuestionnaire: Date = Date()

    private init() {
        setup()
    }
    
    func setup() {
        minuteInterval = 60.0
        hourInterval = 60.0 * minuteInterval
        dayInterval = 24 * hourInterval
        timer = Timer()
    }
    
    func lounchTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self ,
                                     selector: #selector(notifyObservers),
                                     userInfo: nil,
                                     repeats: true)
        dateToNextQuestionnaire = Date(timeIntervalSinceNow: 30)
    }
    
    func registerObserver(_ observer: TimerObserver) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: TimerObserver) {
    }
    
    @objc func notifyObservers() {
        let calendar = Calendar.current
//        let daysToNextQuestionnaire = calendar.component(.second, from: dateToNextQuestionnaire) - calendar.component(.second, from: Date())
        let daysToNextQuestionnaire: Int = Int(dateToNextQuestionnaire.timeIntervalSinceNow)
        // 16:40 -> 10
        // 16:40 -> 40
        observers.forEach { (observer) in
            observer.didUpdate(daysToNextQuestionnaire)
        }

        if daysToNextQuestionnaire <= 0 {
            timer.invalidate()
        }
    }
    
}

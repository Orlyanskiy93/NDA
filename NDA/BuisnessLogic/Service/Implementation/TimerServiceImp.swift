//
//  Timer.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.04.2021.
//

import Foundation

class TimerServiceImp: TimerSubject, TimerService {
    static let shared = TimerServiceImp()
    
    var timer: Timer = Timer()
    var observers: [TimerObserver] = []
    var secondTimeInterval: TimeInterval!
    var minuteInterval: TimeInterval!
    var hourInterval: TimeInterval!
    var dayInterval: TimeInterval!
    var monthInterval: TimeInterval!
    var fireDate: Date = Date()

    private init() {
        secondTimeInterval = 1.0
        minuteInterval = secondTimeInterval * 60.0
        hourInterval = 60.0 * minuteInterval
        dayInterval = 24 * hourInterval
        monthInterval = dayInterval * 30
    }
    
    func setupTimer(with date: Date?) {
        guard let date = date else {
            return
        }
        fireDate = Date(timeInterval: monthInterval, since: date)
        notifyObservers()
    }
    
    func update(_ timeInterval: TimeInterval) -> TimeInterval {
        if timeInterval < minuteInterval {
            return secondTimeInterval
        }
        
        if timeInterval < hourInterval {
            return minuteInterval
        }
        
        if timeInterval < dayInterval {
            return hourInterval
        }
        
        if timeInterval < monthInterval {
            return dayInterval
        }
        
        return 0
    }
    
    func isValid(_ timeInterval: TimeInterval) -> Bool {
        if timer.timeInterval == timeInterval {
            return true
        } else {
            return false
        }
    }
        
    private func launchTimer(with timeInterval: TimeInterval) {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(notifyObservers), userInfo: nil, repeats: true)
    }
        
    func registerObserver(_ observer: TimerObserver) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: TimerObserver) {
    }
    
    @objc func notifyObservers() {
        let timeIntervalToNextQuestionnaire = fireDate.timeIntervalSince1970
        let remainedTimeInterval = timeIntervalToNextQuestionnaire - Date().timeIntervalSince1970
        let timeIntervalForTimer = update(remainedTimeInterval)
        
        observers.forEach { (observer) in
            observer.didUpdate(remainedTimeInterval)
        }
        
        if !isValid(timeIntervalForTimer) {
            launchTimer(with: timeIntervalForTimer)
        }

        if remainedTimeInterval <= 0 {
            stopTimer()
        }
    }
    
    func stopTimer() {
        timer.invalidate()
    }
}

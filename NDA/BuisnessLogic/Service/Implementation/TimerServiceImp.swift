//
//  Timer.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.04.2021.
//

import Foundation

class TimerServiceImp: TimerSubject, TimerService {
    static let shared = TimerServiceImp()
    
    private var timer: Timer = Timer()
    private var observers: [WeakBox] = []
    private var fireDate: Date = Date()
    private var timeIntervalToNextQuestionnaire: TimeInterval {
        return fireDate.timeIntervalSince1970
    }
    private var remainedTimeInterval: TimeInterval {
        return timeIntervalToNextQuestionnaire - Date().timeIntervalSince1970
    }

    private init() {}
    
    func setupTimer(with date: Date?) {
//        guard let date = date else {
//            return
//        }
//        fireDate = Date(timeInterval: TimeInterval().month, since: date)
//        notifyObservers()
    }
    
    private func getTimeIntervalForTimer(from remainedTimeInterval: TimeInterval) -> TimeInterval {
        if remainedTimeInterval < TimeInterval().minute {
            return TimeInterval().second
        }
        
        if remainedTimeInterval < TimeInterval().hour {
            return TimeInterval().minute
        }
        
        if remainedTimeInterval < TimeInterval().day {
            return TimeInterval().hour
        }
        
        if remainedTimeInterval < TimeInterval().month {
            return TimeInterval().day
        }
        
        return 0
    }
    
    func isEqualCurrentTimeIntervalForTimer(to chosenTimeInterval: TimeInterval) -> Bool {
        return timer.timeInterval == chosenTimeInterval
    }
        
    private func launchTimer(with timeInterval: TimeInterval) {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(notifyObservers), userInfo: nil, repeats: true)
    }
        
    func registerObserver(_ observer: TimerObserver) {
        let weakBox = WeakBox(observer)
        let isObserverAlreadyRegistered = observers.contains { (weakBox) -> Bool in
            return weakBox.object === observer
        }
        guard !isObserverAlreadyRegistered else {
            return
        }
        observers.append(weakBox)
    }
    
    func removeObserver(_ observer: TimerObserver) {
        observers.removeAll { (weakBox) -> Bool in
            return weakBox.object === observer
        }
    }
    
    @objc func notifyObservers() {
        let chosenTimeIntervalForTimer = getTimeIntervalForTimer(from: remainedTimeInterval)
        
        observers.forEach { (weakBox) in
            weakBox.object?.didUpdate(remainedTimeInterval)
        }
        
        if !isEqualCurrentTimeIntervalForTimer(to: chosenTimeIntervalForTimer) {
            stopTimer()
            launchTimer(with: chosenTimeIntervalForTimer)
        }

        if remainedTimeInterval <= 0 {
            stopTimer()
        }
    }
    
    func stopTimer() {
        timer.invalidate()
    }
}

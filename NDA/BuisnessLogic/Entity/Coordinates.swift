//
//  Coordinates.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 03.05.2021.
//

import Foundation

struct Coordinates {
    private var dataService = QuestionnaireDataServiceImp.shared
    
    private(set) var points: [(x: Double, y: Double)] = []
    
    init() {
        guard let sessions = try? dataService.getSessions() else {
            return
        }
        points = perform(with: sessions)
    }
    
    private func perform(with sessions: [Session]) -> [(x: Double, y: Double)] {
        var points = [(x: Double, y: Double)]()
        
        for index in 0..<sessions.count {
            let point = (x: Double(index), y: sessions[index].score.average)
            points.append(point)
        }
        return points
    }
}

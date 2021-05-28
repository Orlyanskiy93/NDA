//
//  DateFormatter+customSetup.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.04.2021.
//

import Foundation

extension DateFormatter {
    static func stringForSession(_ date: Date) -> String {
        let dateFormatter = self.init()
        dateFormatter.dateFormat = "d MMMM YYYY"
        return dateFormatter.string(from: date)
    }
}

//
//  TimeInterval+timeUnits.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 08.05.2021.
//

import Foundation

extension TimeInterval {
    var second: Double {
        return 1
    }
    var minute: Double {
        return second * 60
    }
    var hour: Double {
        return minute * 60
    }
    var day: Double {
        return hour * 24
    }
    var month: Double {
        return day * 30
    }
}

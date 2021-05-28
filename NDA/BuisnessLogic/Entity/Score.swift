//
//  Score.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 13.04.2021.
//

import Foundation

struct Score {
    var partOne: Double
    var partTwo: Double
    var partThree: Double
    var average: Double {
        return (partOne + partTwo + partThree) / 3
    }
}

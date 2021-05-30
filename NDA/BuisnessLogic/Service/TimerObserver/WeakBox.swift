//
//  WeakBox.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 12.05.2021.
//

import Foundation

class WeakBox {
    private(set) weak var object: TimerObserver?
    
    init(_ object: TimerObserver) {
        self.object = object
    }
}

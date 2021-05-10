//
//  HistoryDisplayManagerDelegate.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 17.04.2021.
//

import Foundation

protocol HistoryDisplayManagerDelegate: AnyObject {
    func historyDisplayManager( _ historyDisplayManager: HistoryDisplayManager, didSelect session: Session)
}
